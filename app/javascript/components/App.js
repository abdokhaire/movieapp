
import React from 'react'
import { Route, Switch } from 'react-router-dom'
import Movies from './Movies/Movies'
import Movie from './Movie/Movie'

const App = () => {
  return (
    <Switch>
        <Route exact path="/" component={Movies} />
        <Route exact path="/:slug" component={Movie} />

    </Switch>
  )
}

export default App