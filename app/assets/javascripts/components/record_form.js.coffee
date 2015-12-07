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

  handleSubmit: ->
    $.post '', { record: @state }, (data) =>
      @props.handleNewRecord(data)
      @setState @getInitialState()
    , 'JSON'

  render: ->
    form
      className: 'form-inline'
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
        onClick: @handleSubmit
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Create record'


