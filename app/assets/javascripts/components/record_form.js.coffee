{div, form, table, hr, input, button} = React.DOM

@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    amount: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.title && @state.amount && @state.date

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { record: @state }, (data) =>
      @props.handleNewRecord(data)
      @setState @getinitialState()
    , 'JSON'

  render: ->
    form
      className: 'form-inline'
      onSubmit: @handleSubmit
      div
        className: 'form-group'
        input
          type: 'text'
          className: 'form-control'
          placeholder: 'Date'
          name: 'date'
          value: @state.date
          onChange: @handleChange
      div
        className: 'form-group'
        input
          type: 'text'
          className: 'form-control'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
      div
        className: 'form-group'
        input
          type: 'number'
          className: 'form-control'
          placeholder: 'Amount'
          name: 'amount'
          value: @state.amount
          onChange: @handleChange
      button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create record'


