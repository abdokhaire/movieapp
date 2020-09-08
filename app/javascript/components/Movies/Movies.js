import React from 'react'

const Movies = () => {
    const [movies, setMovies] = useState([])
    return(
        <div className="home">
      <div className="header">
        <h1>OpenMovies</h1>
        <p className="subheader">Honest, unbiased Movie reviews.</p>
      </div>
      <div className="grid">
        Movies GRID GOES HERE
      </div>
    </div>
    )
}

export default Movies