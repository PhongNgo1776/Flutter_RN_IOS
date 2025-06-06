import React from 'react';
import {
  StyleSheet,
  Text,
  SafeAreaView,
  View,
  TouchableOpacity,
  NativeModules,
  ToastAndroid,
  Platform,
  Alert,
} from 'react-native';

const { FlutterModule } = NativeModules;

function App(): React.JSX.Element {

  const showFlutter = async () => {
    try {
      const result = await FlutterModule.showFlutter();
      console.log(result);
    } catch (error) {
      Alert.alert('Info', error);
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

        <TouchableOpacity style={styles.recButton} onPress={showFlutter}>
          <Text style={styles.buttonText}>Open Flutter</Text>
        </TouchableOpacity>
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
