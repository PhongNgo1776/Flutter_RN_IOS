

import React from 'react';
import {
  StyleSheet,
  Text,
  SafeAreaView,
  View,
  NativeModules,
  Button,
  Alert,
} from 'react-native';

const { FlutterModule } = NativeModules;

function App(): React.JSX.Element {

  const checkEngine = async () => {
    try {
      const result = await FlutterModule.checkEngineStatus();
      Alert.alert('Engine Status', result);
    } catch (error) {
      Alert.alert('Engine Error', `Failed to check engine: ${error.message}`);
    }
  };

  const openFlutter = async () => {
    try {
      const result = await FlutterModule.showFlutter();
      console.log('Success:', result);
      Alert.alert('Success', result);
    } catch (error) {
      console.error('Error:', error);
      Alert.alert('Error', `Failed to open Flutter: ${error.message}`);
    }
  };

  const openFlutterWithRoute = async () => {
    try {
      const result = await FlutterModule.showFlutterWithRoute('/myFlutterRoute');
      console.log('Success:', result);
      Alert.alert('Success', result);
    } catch (error) {
      console.error('Error:', error);
      Alert.alert('Error', `Failed to open Flutter with route: ${error.message}`);
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.centeredView}>
        <Text
          style={{
            textAlign: 'center',
            fontSize: 20,
            fontWeight: 'bold',
          }}>
          Welcome to React Native!</Text>

        <Button title="Check Engine Status" onPress={checkEngine} />
        <Button title="Open Flutter View" onPress={openFlutter} />
        <Button title="Open Flutter with Route" onPress={openFlutterWithRoute} />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  centeredView: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  flutterContainer: {
    margin: 20,
    borderRadius: 2,
  },
  flutterView: {
    height: 1100,
    width: 800,
  },
  recButton: {
    backgroundColor: 'red',
    width: 250,
    height: 50,
    borderRadius: 20,
    justifyContent: 'center',
    alignItems: 'center',
    marginTop: 20,
  },
  buttonText: {
    color: '#fff',
    fontWeight: 'bold',
    fontSize: 17,
  },
});

export default App;
