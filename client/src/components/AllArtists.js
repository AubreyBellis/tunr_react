import React, { Component } from 'react';
import axios from 'axios';
import ArtistCard from './ArtistCard';
import styled from 'styled-components';

const ArtistListStyles = styled.div`

    width: 90%;
    margin: 20px 5%;
    display:flex;
    justify-content: space-around;
    flex-wrap: wrap;
`;

class AllArtists extends Component{
  constructor(){
    super();
    this.state = {
      error: '',
      artists: []
    }
  }

  componentWillMount(){
    this._fetchArtists();
  }

  _fetchArtists = async () => {
    try {
      const response = await axios.get('/api/artists');
      const artists = response.data;
      this.setState({artists});
    } catch (err) {
      this.setState({error: err})
    }
  }

  render(){
    return (
      <div>
      <ArtistListStyles>
        {this.state.artists.map((artist) => (
            <ArtistCard key={artist.id} artist={artist} />
          )
        )}
        </ArtistListStyles>
      </div>
    )
  }
}

export default AllArtists;