import React from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  Alert,
  StyleSheet,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { COLORS } from '../theme';

const ESTILO_LABELS = {
  cinematico: 'Cinemático',
  motion: 'Motion',
  publi: 'Publi',
};

const FORMATO_LABELS = {
  '16:9': '16:9 (Vídeo Longo)',
  '9:16': '9:16 (Vídeo Curto)',
};

const NECESSIDADE_LABELS = {
  legendas: 'Legendas',
  vfx: 'VFX',
  sfx: 'SFX',
  colorGrading: 'Color Grading',
  motionGraphics: 'Motion Graphics',
  transicoes: 'Transições Premium',
  animacoesTexto: 'Animações de Texto',
  outros: 'Outros',
};

const FAIXA_LABELS = {
  basico: 'Básico (até R$ 800)',
  intermediario: 'Intermediário (R$ 800 - R$ 1.800)',
  avancado: 'Avançado (R$ 1.800 - R$ 3.500)',
  premium: 'Premium (acima de R$ 3.500)',
};

export default function FinalizacaoScreen({ data }) {
  const [confirmed, setConfirmed] = React.useState(false);

  const handleSubmit = () => {
    if (!confirmed) {
      Alert.alert(
        'Atenção',
        'Por favor, confirme que todas as informações estão corretas.'
      );
      return;
    }
    Alert.alert(
      'Solicitação Enviada!',
      'Em breve entrarei em contato com você para alinharmos os próximos passos!',
      [{ text: 'OK' }]
    );
  };

  const necessidadesList = (data.necessidades || [])
    .map((n) => NECESSIDADE_LABELS[n])
    .filter(Boolean)
    .join(', ');

  const orcamentoText = data.orcamentoCustom
    ? `R$ ${data.orcamentoCustom}`
    : data.faixaOrcamento
    ? FAIXA_LABELS[data.faixaOrcamento]
    : 'Não informado';

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <View style={styles.headerIcon}>
        <Ionicons name="checkmark-circle" size={48} color={COLORS.copper} />
      </View>
      <Text style={styles.title}>TUDO PRONTO!</Text>
      <Text style={styles.subtitle}>
        Revise os detalhes do seu projeto{'\n'}antes de enviar.
      </Text>

      <View style={styles.summaryCard}>
        <View style={styles.summarySection}>
          <Text style={styles.sectionLabel}>INFORMAÇÕES</Text>
          <SummaryItem label="Nome" value={data.nome || '—'} />
          <SummaryItem label="E-mail" value={data.email || '—'} />
          <SummaryItem label="WhatsApp" value={data.whatsapp || '—'} />
          <SummaryItem label="Canal" value={data.linkCanal || '—'} />
          <SummaryItem label="Plataforma" value={data.plataforma || '—'} />
        </View>

        <View style={styles.separator} />

        <View style={styles.summarySection}>
          <Text style={styles.sectionLabel}>ESTILO</Text>
          <SummaryItem
            label="Estilo"
            value={ESTILO_LABELS[data.estilo] || '—'}
          />
          <SummaryItem
            label="Formato"
            value={FORMATO_LABELS[data.formato] || '—'}
          />
          <SummaryItem
            label="Captação"
            value={data.captacao ? 'Sim' : 'Não'}
          />
          {data.captacao && data.localCaptacao && (
            <SummaryItem label="Local" value={data.localCaptacao} />
          )}
        </View>

        <View style={styles.separator} />

        <View style={styles.summarySection}>
          <Text style={styles.sectionLabel}>NECESSIDADES</Text>
          <Text style={styles.summaryValue}>
            {necessidadesList || 'Nenhuma selecionada'}
          </Text>
        </View>

        <View style={styles.separator} />

        <View style={styles.summarySection}>
          <Text style={styles.sectionLabel}>ORÇAMENTO</Text>
          {data.faixaOrcamento && (
            <SummaryItem
              label="Faixa selecionada"
              value={FAIXA_LABELS[data.faixaOrcamento] || '—'}
            />
          )}
          {data.orcamentoCustom ? (
            <SummaryItem
              label="Valor personalizado"
              value={`R$ ${data.orcamentoCustom}`}
            />
          ) : null}
          {!data.faixaOrcamento && !data.orcamentoCustom && (
            <Text style={styles.summaryValue}>Não informado</Text>
          )}
        </View>

        {data.linkReferencia ? (
          <>
            <View style={styles.separator} />
            <View style={styles.summarySection}>
              <Text style={styles.sectionLabel}>REFERÊNCIA</Text>
              <Text style={styles.summaryValue}>{data.linkReferencia}</Text>
            </View>
          </>
        ) : null}
      </View>

      <TouchableOpacity
        style={styles.confirmRow}
        onPress={() => setConfirmed(!confirmed)}
        activeOpacity={0.7}
      >
        <View style={[styles.checkbox, confirmed && styles.checkboxActive]}>
          {confirmed && (
            <Ionicons name="checkmark" size={14} color={COLORS.white} />
          )}
        </View>
        <Text style={styles.confirmText}>
          Confirmo que todas as informações{'\n'}estão corretas.
        </Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={[styles.submitButton, !confirmed && styles.submitButtonDisabled]}
        onPress={handleSubmit}
        activeOpacity={0.8}
      >
        <Text style={styles.submitButtonText}>ENVIAR SOLICITAÇÃO</Text>
        <Ionicons name="send" size={18} color={COLORS.white} />
      </TouchableOpacity>

      <Text style={styles.footerText}>
        Em breve entrarei em contato com você{'\n'}para alinharmos os próximos
        passos!
      </Text>

      <View style={styles.footerHeart}>
        <Ionicons name="heart" size={16} color={COLORS.copper} />
      </View>

      <View style={{ height: 30 }} />
    </ScrollView>
  );
}

function SummaryItem({ label, value }) {
  return (
    <View style={styles.summaryItem}>
      <Text style={styles.summaryLabel}>{label}:</Text>
      <Text style={styles.summaryValue}>{value}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingHorizontal: 20,
  },
  headerIcon: {
    alignItems: 'center',
    marginTop: 8,
    marginBottom: 8,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: COLORS.copper,
    textAlign: 'center',
    letterSpacing: 3,
  },
  subtitle: {
    fontSize: 13,
    color: COLORS.textSecondary,
    textAlign: 'center',
    marginTop: 6,
    marginBottom: 20,
    lineHeight: 18,
  },
  summaryCard: {
    backgroundColor: COLORS.cardBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 14,
    padding: 16,
    marginBottom: 16,
  },
  summarySection: {
    paddingVertical: 4,
  },
  sectionLabel: {
    fontSize: 12,
    fontWeight: '700',
    color: COLORS.copper,
    letterSpacing: 1.5,
    marginBottom: 6,
  },
  separator: {
    height: 1,
    backgroundColor: COLORS.border,
    marginVertical: 10,
  },
  summaryItem: {
    flexDirection: 'row',
    marginBottom: 3,
  },
  summaryLabel: {
    fontSize: 12,
    color: COLORS.textSecondary,
    marginRight: 6,
  },
  summaryValue: {
    fontSize: 12,
    color: COLORS.white,
    flex: 1,
  },
  confirmRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 16,
  },
  checkbox: {
    width: 24,
    height: 24,
    borderRadius: 6,
    borderWidth: 1.5,
    borderColor: COLORS.border,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10,
  },
  checkboxActive: {
    backgroundColor: COLORS.copper,
    borderColor: COLORS.copper,
  },
  confirmText: {
    fontSize: 12,
    color: COLORS.textSecondary,
    lineHeight: 17,
  },
  submitButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: COLORS.copper,
    borderRadius: 12,
    paddingVertical: 16,
    gap: 10,
  },
  submitButtonDisabled: {
    opacity: 0.5,
  },
  submitButtonText: {
    fontSize: 15,
    fontWeight: 'bold',
    color: COLORS.white,
    letterSpacing: 2,
  },
  footerText: {
    fontSize: 11,
    color: COLORS.textMuted,
    textAlign: 'center',
    marginTop: 16,
    lineHeight: 16,
  },
  footerHeart: {
    alignItems: 'center',
    marginTop: 8,
  },
});
