import React, { Component } from 'react'
import axios from 'axios'
import styled from 'styled-components'

const ArtistStyles = styled.div`
  img {
    max-height: 400px;
    width: 100%;
  }
`;

class Artist extends Component{
  constructor(){
    super();
    this.state = {
      artist: {},
      songs: []
    }
  }

  componentWillMount(){
    this._fetchArtistAndSongs();
  }

  _fetchArtistAndSongs = async () => {
    const id = this.props.match.params.id;
    const res = await axios.get(`/api/artists/${id}`)
    this.setState({
      artist: res.data.artist,
      songs: res.data.songs
    })
  }

  render(){
    return (
      <ArtistStyles>
        <img src={this.state.artist.photo_url} />
        <h1>{this.state.artist.name}</h1>
        <h4>Nationality: {this.state.artist.nationality}</h4>
        <h3>Songs</h3>
        {this.state.songs.map(song => (
          <div key={song.id}>
            <p>Title: {song.title}</p>
            <p>Album: {song.album}</p>
            <audio controls src={song.preview_url}></audio>
          </div>
        ))}
      </ArtistStyles>
    )
  }
}

export default Artist