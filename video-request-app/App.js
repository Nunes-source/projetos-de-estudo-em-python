import React, { useState } from 'react';
import {
  View,
  StyleSheet,
  StatusBar,
  Platform,
} from 'react-native';
import { COLORS } from './theme';
import Header from './components/Header';
import BottomTabs from './components/BottomTabs';
import InformacoesScreen from './screens/InformacoesScreen';
import EstiloScreen from './screens/EstiloScreen';
import NecessidadesScreen from './screens/NecessidadesScreen';
import BudgetScreen from './screens/BudgetScreen';
import FinalizacaoScreen from './screens/FinalizacaoScreen';

export default function App() {
  const [step, setStep] = useState(0);
  const [formData, setFormData] = useState({
    nome: '',
    email: '',
    whatsapp: '',
    linkCanal: '',
    plataforma: '',
    estilo: '',
    formato: '16:9',
    captacao: false,
    localCaptacao: '',
    necessidades: [],
    linkReferencia: '',
    orcamentoCustom: '',
    faixaOrcamento: '',
  });

  const handleChange = (field, value) => {
    setFormData((prev) => ({ ...prev, [field]: value }));
  };

  const goNext = () => {
    if (step < 4) setStep(step + 1);
  };

  const goBack = () => {
    if (step > 0) setStep(step - 1);
  };

  const renderScreen = () => {
    switch (step) {
      case 0:
        return (
          <InformacoesScreen data={formData} onChange={handleChange} />
        );
      case 1:
        return <EstiloScreen data={formData} onChange={handleChange} />;
      case 2:
        return (
          <NecessidadesScreen data={formData} onChange={handleChange} />
        );
      case 3:
        return (
          <BudgetScreen
            data={formData}
            onChange={handleChange}
            onNext={goNext}
          />
        );
      case 4:
        return <FinalizacaoScreen data={formData} />;
      default:
        return null;
    }
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor={COLORS.background} />
      <Header onBack={goBack} showBack={step > 0} />
      <View style={styles.content}>{renderScreen()}</View>
      <BottomTabs currentStep={step} onChangeStep={setStep} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: COLORS.background,
    paddingTop: Platform.OS === 'android' ? StatusBar.currentHeight : 44,
  },
  content: {
    flex: 1,
  },
});
