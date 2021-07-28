<template>
  <div>
    <div class="q-pa-md" style="max-width: 400px">
      <div class="q-gutter-md">
        <q-select
          v-model="company"
          :options="companyOptions"
          option-value="id"
          option-label="name"
          label="Company"
          ></q-select>

        <q-select
          v-model="counterparty"
          :options="counterpartyOptions"
          option-value="id"
          option-label="name"
          label="Counterparty"
          ></q-select>

        <q-select
          v-model="warehouse"
          :options="warehouseOptions"
          option-value="id"
          option-label="name"
          label="Warehouse"
          ></q-select>

        <q-select
          v-model="broker"
          :options="brokerOptions"
          option-value="id"
          option-label="name"
          label="Broker"
          ></q-select>
      </div>
    </div>
    <div class="q-pa-md">
      <q-table
        title="Products"
        :data="rows"
        :columns="columns"
        separator="cell"
        >
        <template v-slot:header="props">
          <q-tr :props="props">
            <q-th auto-width></q-th>
            <q-th
              v-for="col in props.cols"
              :key="col.name"
              :props="props"
              >
              {{ col.label }}
            </q-th>
          </q-tr>
        </template>

        <template v-slot:body="props">
          <q-tr :props="props">
            <q-td auto-width>
              <q-btn
                size="sm"
                color="primary"
                round
                dense
                icon="remove"
                @click="deleteRow(props.row.lineNumber)"
                ></q-btn>
            </q-td>
            <q-td :props="props" key="lineNumber">
              {{ props.row.lineNumber }}
            </q-td>
            <q-td>
              <q-input v-model="props.row.upc" autofocus borderless filled dense></q-input>
            </q-td>
            <q-td>
              <q-input v-model="props.row.quantity" borderless filled dense></q-input>
            </q-td>
            <q-td>
              <q-input v-model="props.row.price" borderless filled dense></q-input>
            </q-td>
            <q-td :props="props" key="amount">
              {{ props.row.amount }}
            </q-td>
            <q-td>
              <q-input v-model="props.row.brokerPrice" borderless filled dense></q-input>
            </q-td>
            <q-td :props="props" key="brokerAmount">
              {{ props.row.prokerAmount }}
            </q-td>
            <q-td :props="props" key="total">
              {{ props.row.total }}
            </q-td>
          </q-tr>
        </template>
      </q-table>

    </div>
    <div class="q-pa-md">
      <q-btn unelevated round color="primary" icon="add" @click="addRow"/>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

const columns = [
  { name: 'lineNumber', label: '#', field: 'line_number', align: 'left', headerStyle: 'width: 15px' },
  { name: 'upc', label: 'UPC', field: 'upc', align: 'left', headerStyle: 'width: 200px'},
  { name: 'quantity', label: 'Quantity', field: 'quantity', align: 'left', headerStyle: 'width: 100px' },
  { name: 'price', label: 'Price', field: 'price', align: 'left', headerStyle: 'width: 100px' },
  { name: 'amount', label: 'Amount', field: 'amount', align: 'left', headerStyle: 'width: 100px' },
  { name: 'brokerPrice', label: 'Broker price', field: 'broker_price', align: 'left', headerStyle: 'width: 100px' },
  { name: 'brokerAmount', label: 'Broker amount', field: 'broker_amount', align: 'left', headerStyle: 'width: 100px' },
  { name: 'total', label: 'Total', field: 'total', align: 'left', headerStyle: 'width: 100px' }
]

export default {
  data() {
    return {
      company: null,
      companyOptions: [],
      counterparty: null,
      counterpartyOptions: [],
      warehouse: null,
      warehouseOptions: [],
      broker: null,
      brokerOptions: [],
      columns,
      rows: []
    }
  },
  methods: {
    fetchCompanies() {
      axios.get('/api/v1/companies')
        .then(({ data }) => {
          this.companyOptions = data
        })
    },
    fetchBrokers() {
      axios.get('/api/v1/brokers')
        .then(({ data }) => {
          this.brokerOptions = data
        })
    },
    fetchCounterparties() {
      axios.get('/api/v1/counterparties')
        .then(({ data }) => {
          this.counterpartyOptions = data
        })
    },
    fetchWarehouses() {
      axios.get('/api/v1/warehouses')
        .then(({ data }) => {
          this.warehouseOptions = data
        })
    },
    loadSelects() {
      this.fetchCompanies()
      this.fetchBrokers()
      this.fetchCounterparties()
      this.fetchWarehouses()
    },
    addRow() {
      this.rows.push({
        lineNumber: this.rows.length + 1
      })
    },
    deleteRow(id) {
      this.rows = this.rows.filter(item => item.lineNumber !== id).map((item, index) => {
        item.lineNumber = index + 1
        return item
      })
    }
  },
  created() {
    this.loadSelects()
  }
}

</script>

<style scoped>

</style>
