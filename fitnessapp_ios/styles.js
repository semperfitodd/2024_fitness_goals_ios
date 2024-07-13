import { StyleSheet, Dimensions } from 'react-native';

const colors = {
  primary: '#2c3e50',
  secondary: '#1e69de',
  background: '#f4f6f8',
  white: '#ffffff',
  border: '#787878',
  error: 'red',
  placeholder: '#999',
};

const styles = StyleSheet.create({
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.background,
  },
  loadingText: {
    marginTop: 20,
    fontSize: 18,
    color: colors.primary,
  },
  footerText: {
    marginTop: 10,
    fontSize: 16,
    color: colors.primary,
  },
  container: {
    flexGrow: 1,
    padding: 10,
    backgroundColor: colors.background,
  },
  landscapeContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.background,
    width: Dimensions.get('window').width, // Use width for landscape
    height: Dimensions.get('window').height - 100, // Use height for landscape, adjusted
  },
  graphContainer: {
    width: Dimensions.get('window').width,
    height: Dimensions.get('window').height - 100,
    position: 'absolute', // Ensure the container takes up the full screen
    top: 0,
    left: 0,
  },
  header: {
    alignItems: 'center',
    marginBottom: 20,
    backgroundColor: colors.white,
    padding: 20,
    borderRadius: 10,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.2,
    shadowRadius: 5,
    elevation: 3,
    width: '100%',
  },
  title: {
    fontSize: 20,
    marginBottom: 10,
    color: colors.primary,
    fontWeight: 'bold',
    textAlign: 'center',
  },
  date: {
    fontSize: 16,
    marginBottom: 10,
    color: colors.primary,
    textAlign: 'center',
  },
  stats: {
    flexDirection: 'column',
    alignItems: 'center',
    width: '100%',
  },
  statText: {
    fontSize: 14,
    color: colors.primary,
    marginBottom: 5,
  },
  card: {
    backgroundColor: colors.white,
    padding: 15,
    borderRadius: 8,
    marginBottom: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 5,
    elevation: 2,
    width: '100%',
  },
  exerciseName: {
    fontSize: 18,
    marginBottom: 10,
    color: colors.secondary,
    fontWeight: 'bold',
    textAlign: 'center',
  },
  exerciseDetails: {
    flexDirection: 'column',
    alignItems: 'center',
    width: '100%',
  },
  detailRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    width: '80%',
    paddingVertical: 5,
  },
  detailLabel: {
    fontSize: 16,
    color: colors.primary,
    fontWeight: 'bold',
  },
  detailValue: {
    fontSize: 16,
    color: colors.primary,
  },
  errorText: {
    fontSize: 18,
    color: colors.error,
    textAlign: 'center',
  },
  rotateText: {
    fontSize: 18,
    color: colors.primary,
    textAlign: 'center',
    marginTop: 20,
  },
  heading: {
    fontSize: 24,
    marginBottom: 20,
    textAlign: 'center',
    color: colors.primary,
  },
  input: {
    height: 40,
    borderColor: colors.border,
    borderWidth: 1,
    marginBottom: 20,
    paddingHorizontal: 10,
    borderRadius: 4,
    color: '#000',
  },
  legendContainer: {
    flexDirection: 'row',
    justifyContent: 'center',
    marginTop: 10,
  },
  legendItem: {
    flexDirection: 'row',
    alignItems: 'center',
    marginHorizontal: 5,
  },
  legendColor: {
    width: 10,
    height: 10,
    marginRight: 5,
  },
  legendLabel: {
    fontSize: 12,
    color: colors.primary,
  },
  signInButtonContainer: {
    marginTop: 20,
    alignItems: 'center',
  },
});

export default styles;
