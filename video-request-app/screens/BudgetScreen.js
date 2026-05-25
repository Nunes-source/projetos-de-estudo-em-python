import React from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  TextInput,
  StyleSheet,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { COLORS } from '../theme';

const FAIXAS = [
  {
    id: 'basico',
    nome: 'BÁSICO',
    range: 'até R$ 800',
    desc: 'Edições simples, cortes e ajustes básicos.',
    icon: 'star-outline',
  },
  {
    id: 'intermediario',
    nome: 'INTERMEDIÁRIO',
    range: 'R$ 800 - R$ 1.800',
    desc: 'Edição completa + recursos adicionais.',
    icon: 'star-half-outline',
  },
  {
    id: 'avancado',
    nome: 'AVANÇADO',
    range: 'R$ 1.800 - R$ 3.500',
    desc: 'Recursos avançados, VFX, motion e mais.',
    icon: 'star',
  },
  {
    id: 'premium',
    nome: 'PREMIUM',
    range: 'acima de R$ 3.500',
    desc: 'Projetos complexos e alta qualidade.',
    icon: 'diamond-outline',
  },
];

export default function BudgetScreen({ data, onChange, onNext }) {
  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <Text style={styles.title}>QUAL SEU{'\n'}INVESTIMENTO?</Text>
      <Text style={styles.subtitle}>
        Informe quanto você pretende investir{'\n'}ou escolha uma faixa sugerida.
      </Text>

      <Text style={styles.sectionTitle}>QUAL SEU ORÇAMENTO?</Text>
      <View style={styles.budgetInput}>
        <Text style={styles.currency}>R$</Text>
        <TextInput
          style={styles.budgetTextInput}
          placeholder="Ex: 1500,00"
          placeholderTextColor={COLORS.textMuted}
          value={data.orcamentoCustom}
          onChangeText={(v) => onChange('orcamentoCustom', v)}
          keyboardType="numeric"
        />
      </View>

      <View style={styles.divider}>
        <View style={styles.dividerLine} />
        <Text style={styles.dividerText}>OU ESCOLHA UMA FAIXA SUGERIDA</Text>
        <View style={styles.dividerLine} />
      </View>

      {FAIXAS.map((faixa) => {
        const selected = data.faixaOrcamento === faixa.id;
        return (
          <TouchableOpacity
            key={faixa.id}
            style={[styles.faixaCard, selected && styles.faixaCardActive]}
            onPress={() => onChange('faixaOrcamento', faixa.id)}
            activeOpacity={0.7}
          >
            <View style={styles.faixaIcon}>
              <Ionicons name={faixa.icon} size={20} color={COLORS.copper} />
            </View>
            <View style={styles.faixaInfo}>
              <Text style={styles.faixaNome}>{faixa.nome}</Text>
              <Text style={styles.faixaRange}>{faixa.range}</Text>
              <Text style={styles.faixaDesc}>{faixa.desc}</Text>
            </View>
            <View style={[styles.radio, selected && styles.radioActive]}>
              {selected && <View style={styles.radioDot} />}
            </View>
          </TouchableOpacity>
        );
      })}

      <TouchableOpacity style={styles.nextButton} onPress={onNext}>
        <Text style={styles.nextButtonText}>PRÓXIMO</Text>
        <Ionicons name="arrow-forward" size={20} color={COLORS.white} />
      </TouchableOpacity>

      <View style={{ height: 30 }} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 20,
  },
  title: {
    fontSize: 26,
    fontWeight: 'bold',
    color: COLORS.copper,
    letterSpacing: 2,
    lineHeight: 34,
    marginTop: 8,
  },
  subtitle: {
    fontSize: 13,
    color: COLORS.textSecondary,
    marginTop: 6,
    marginBottom: 20,
    lineHeight: 18,
  },
  sectionTitle: {
    fontSize: 13,
    fontWeight: '700',
    color: COLORS.copper,
    letterSpacing: 1.5,
    marginBottom: 10,
    textAlign: 'center',
  },
  budgetInput: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: COLORS.cardBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 12,
    paddingHorizontal: 16,
    paddingVertical: 14,
    marginBottom: 16,
  },
  currency: {
    fontSize: 16,
    fontWeight: 'bold',
    color: COLORS.copper,
    marginRight: 10,
  },
  budgetTextInput: {
    flex: 1,
    color: COLORS.white,
    fontSize: 16,
  },
  divider: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 16,
  },
  dividerLine: {
    flex: 1,
    height: 1,
    backgroundColor: COLORS.border,
  },
  dividerText: {
    fontSize: 10,
    color: COLORS.textMuted,
    marginHorizontal: 10,
    letterSpacing: 0.5,
  },
  faixaCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: COLORS.cardBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 12,
    padding: 14,
    marginBottom: 10,
  },
  faixaCardActive: {
    borderColor: COLORS.copper,
    backgroundColor: 'rgba(196,129,61,0.1)',
  },
  faixaIcon: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: COLORS.inputBg,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  faixaInfo: {
    flex: 1,
  },
  faixaNome: {
    fontSize: 13,
    fontWeight: 'bold',
    color: COLORS.copper,
    letterSpacing: 1,
  },
  faixaRange: {
    fontSize: 12,
    color: COLORS.white,
    marginTop: 1,
  },
  faixaDesc: {
    fontSize: 10,
    color: COLORS.textSecondary,
    marginTop: 2,
  },
  radio: {
    width: 22,
    height: 22,
    borderRadius: 11,
    borderWidth: 2,
    borderColor: COLORS.border,
    justifyContent: 'center',
    alignItems: 'center',
  },
  radioActive: {
    borderColor: COLORS.copper,
  },
  radioDot: {
    width: 12,
    height: 12,
    borderRadius: 6,
    backgroundColor: COLORS.copper,
  },
  nextButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: COLORS.copper,
    borderRadius: 12,
    paddingVertical: 16,
    marginTop: 10,
    gap: 8,
  },
  nextButtonText: {
    fontSize: 15,
    fontWeight: 'bold',
    color: COLORS.white,
    letterSpacing: 2,
  },
});
