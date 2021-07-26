import React, {useEffect, useState} from 'react';

import {ActivityIndicator, FlatList, Text, View} from 'react-native';
import axios from 'axios';

const App = () => {
  const [loading, setLoading] = useState([true]);
  const [book, setBook] = useState([]);

  const getBook = async () => {
    await axios
      .get('http://10.0.2.2/laravel/public/api/books')
      .then(res => {
        const data = res.data;
        setBook(data.data);
      })
      .catch(e => {
        console.log(e);
      })
      .finally(() => {
        setLoading(false);
      });
  };

  useEffect(() => {
    getBook();
  }, []);

  return (
    <View>
      {loading ? (
        <ActivityIndicator />
      ) : (
        <FlatList
          data={book}
          keyExtractor={({id}, index) => id}
          renderItem={({item}) => (
            <Text>
              {item.title} , {item.author} , {item.publication}
            </Text>
          )}
        />
      )}
    </View>
  );
};

export default App;
