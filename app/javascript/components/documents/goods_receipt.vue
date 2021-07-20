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
                @click="deleteRow(props.row.line_number)"
                ></q-btn>
            </q-td>
            <q-td :props="props" key="line_number">
              {{ props.row.line_number }}
            </q-td>
            <q-td>
              <q-input v-model="props.row.upc" autofucus borderless filled dense></q-input>
            </q-td>
            <q-td>
              <q-input v-model="props.row.quantity" autofucus borderless filled dense></q-input>
            </q-td>
            <q-td>
              <q-input v-model="props.row.price" autofucus borderless filled dense></q-input>
            </q-td>
            <q-td :props="props" key="amount">
              {{ props.row.amount }}
            </q-td>
            <q-td>
              <q-input v-model="props.row.broker_price" autofucus borderless filled dense></q-input>
            </q-td>
            <q-td :props="props" key="broker_amount">
              {{ props.row.proker_amount }}
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
  { name: 'line_number', label: '#', field: 'line_number', align: 'left', headerStyle: 'width: 15px' },
  { name: 'upc', label: 'UPC', field: 'upc', align: 'left', headerStyle: 'width: 200px'},
  { name: 'quantity', label: 'Quantity', field: 'quantity', align: 'left', headerStyle: 'width: 100px' },
  { name: 'price', label: 'Price', field: 'price', align: 'left', headerStyle: 'width: 100px' },
  { name: 'amount', label: 'Amount', field: 'amount', align: 'left', headerStyle: 'width: 100px' },
  { name: 'broker_price', label: 'Broker price', field: 'broker_price', align: 'left', headerStyle: 'width: 100px' },
  { name: 'broker_amount', label: 'Broker amount', field: 'broker_amount', align: 'left', headerStyle: 'width: 100px' },
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
      rows: [
        {
          line_number: 1
        }
      ]
    }
  },
  methods: {
    fetchCompany() {
      axios.get('/api/v1/companies')
        .then(({ data }) => {
          this.companyOptions = data
        })
    },
    fetchBroker() {
      axios.get('/api/v1/brokers')
        .then(({ data }) => {
          this.brokerOptions = data
        })
    },
    fetchCounterpraty() {
      axios.get('/api/v1/counterparties')
        .then(({ data }) => {
          this.counterpartyOptions = data
        })
    },
    fetchWarehouse() {
      axios.get('/api/v1/warehouses')
        .then(({ data }) => {
          this.warehouseOptions = data
        })
    },
    load_selects() {
      this.fetchCompany()
      this.fetchBroker()
      this.fetchCounterpraty()
      this.fetchWarehouse()
    },
    addRow() {
      this.rows.push({
        line_number: this.rows.length + 1
      })
    },
    deleteRow(id) {
      this.rows = this.rows.filter(item => item.line_number !== id).map((item, index) => {
        item.line_number = index + 1
        return item
      })
    }
  },
  created() {
    this.load_selects()
  }
}

</script>

<style scoped>

</style>
