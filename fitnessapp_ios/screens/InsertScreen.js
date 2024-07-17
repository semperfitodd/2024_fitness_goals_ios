import React, {useEffect, useState} from 'react';
import {Alert, Button, Keyboard, Text, TextInput, TouchableWithoutFeedback, View} from 'react-native';
import axios from 'axios';
import DateTimePicker from '@react-native-community/datetimepicker';
import * as Keychain from 'react-native-keychain';
import {useNavigation} from '@react-navigation/native';
import styles from '../styles';

const API_ENDPOINT = 'https://fitness.bernsonfamily.net/insert';

const InsertScreen = () => {
    const [exerciseData, setExerciseData] = useState({
        date: new Date(),
        pullups: '',
        pushups: '',
        squats: '',
        hspu: '',
    });
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [showDatePicker, setShowDatePicker] = useState(false);
    const navigation = useNavigation();

    useEffect(() => {
        const checkIfSignedIn = async () => {
            const token = await Keychain.getGenericPassword();
            if (!token) {
                navigation.navigate('SignInScreen');
            }
        };
        checkIfSignedIn();
    }, [navigation]);

    const handleInputChange = (name, value) => {
        setExerciseData({...exerciseData, [name]: value});
    };

    const handleSubmit = async () => {
        setIsSubmitting(true);
        try {
            const response = await axios.post(API_ENDPOINT, exerciseData);

            if (response.status === 200) {
                Alert.alert('Success', 'Record successfully inserted!', [
                    {text: 'OK', onPress: () => navigation.navigate('Progress', {refresh: true})},
                ]);
            } else {
                Alert.alert('Error', 'Failed to insert record.');
            }
        } catch (error) {
            console.error('Error submitting data:', error);
            Alert.alert('Error', 'Failed to insert record.');
        }
        setIsSubmitting(false);
    };

    const handleDateChange = (event, selectedDate) => {
        const currentDate = selectedDate || exerciseData.date;
        setShowDatePicker(false);
        setExerciseData({...exerciseData, date: currentDate});
    };

    return (
        <TouchableWithoutFeedback onPress={Keyboard.dismiss}>
            <View style={styles.container}>
                <Text style={styles.heading}>Insert New Records</Text>
                <TextInput
                    style={styles.input}
                    placeholder="Date"
                    placeholderTextColor="#999"
                    value={exerciseData.date.toISOString().split('T')[0]}
                    onFocus={() => setShowDatePicker(true)}
                    showSoftInputOnFocus={false}
                />
                {showDatePicker && (
                    <DateTimePicker
                        value={exerciseData.date}
                        mode="date"
                        display="default"
                        onChange={handleDateChange}
                    />
                )}
                <TextInput
                    style={styles.input}
                    placeholder="Pull-ups"
                    placeholderTextColor="#999"
                    keyboardType="numeric"
                    value={exerciseData.pullups}
                    onChangeText={value => handleInputChange('pullups', value)}
                />
                <TextInput
                    style={styles.input}
                    placeholder="Push-ups"
                    placeholderTextColor="#999"
                    keyboardType="numeric"
                    value={exerciseData.pushups}
                    onChangeText={value => handleInputChange('pushups', value)}
                />
                <TextInput
                    style={styles.input}
                    placeholder="Squats"
                    placeholderTextColor="#999"
                    keyboardType="numeric"
                    value={exerciseData.squats}
                    onChangeText={value => handleInputChange('squats', value)}
                />
                <TextInput
                    style={styles.input}
                    placeholder="HSPU"
                    placeholderTextColor="#999"
                    keyboardType="numeric"
                    value={exerciseData.hspu}
                    onChangeText={value => handleInputChange('hspu', value)}
                />
                <Button
                    title={isSubmitting ? 'Submitting...' : 'Submit'}
                    onPress={handleSubmit}
                    disabled={isSubmitting}
                />
            </View>
        </TouchableWithoutFeedback>
    );
};

export default InsertScreen;
