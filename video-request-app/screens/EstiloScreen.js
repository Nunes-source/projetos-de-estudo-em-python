import React from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  Switch,
  TextInput,
  StyleSheet,
} from 'react-native';
import { Ionicons, MaterialCommunityIcons } from '@expo/vector-icons';
import { COLORS } from '../theme';

const ESTILOS = [
  {
    id: 'cinematico',
    nome: 'CINEMÁTICO',
    desc: 'Visual dramático, emoção e narrativa marcante.',
    icon: 'film',
  },
  {
    id: 'motion',
    nome: 'MOTION',
    desc: 'Animações, gráficos e movimento que chamam atenção.',
    icon: 'animation-play',
  },
  {
    id: 'publi',
    nome: 'PUBLI',
    desc: 'Focado em vendas, produto e resultado objetivo.',
    icon: 'bullhorn',
  },
];

export default function EstiloScreen({ data, onChange }) {
  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <Text style={styles.title}>QUAL O ESTILO{'\n'}DO SEU VÍDEO?</Text>
      <Text style={styles.subtitle}>
        Selecione o estilo que mais combina{'\n'}com seu projeto.
      </Text>

      <View style={styles.section}>
        {ESTILOS.map((estilo) => {
          const selected = data.estilo === estilo.id;
          return (
            <TouchableOpacity
              key={estilo.id}
              style={[styles.estiloCard, selected && styles.estiloCardActive]}
              onPress={() => onChange('estilo', estilo.id)}
              activeOpacity={0.7}
            >
              <View style={styles.estiloImagePlaceholder}>
                <MaterialCommunityIcons
                  name={estilo.icon}
                  size={32}
                  color={COLORS.copper}
                />
              </View>
              <View style={styles.estiloInfo}>
                <Text style={styles.estiloNome}>{estilo.nome}</Text>
                <Text style={styles.estiloDesc}>{estilo.desc}</Text>
              </View>
              {selected && (
                <Ionicons
                  name="checkmark-circle"
                  size={22}
                  color={COLORS.copper}
                />
              )}
            </TouchableOpacity>
          );
        })}
      </View>

      <Text style={styles.sectionTitle}>FORMATO DO VÍDEO</Text>
      <View style={styles.formatRow}>
        <TouchableOpacity
          style={[
            styles.formatCard,
            data.formato === '16:9' && styles.formatCardActive,
          ]}
          onPress={() => onChange('formato', '16:9')}
        >
          <View style={styles.formatIconWrap}>
            <Ionicons name="tv-outline" size={24} color={COLORS.copper} />
            <Text style={styles.formatRatio}>16:9</Text>
          </View>
          <Text style={styles.formatLabel}>VÍDEO LONGO</Text>
          <Text style={styles.formatSub}>(YouTube, etc.)</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={[
            styles.formatCard,
            data.formato === '9:16' && styles.formatCardActive,
          ]}
          onPress={() => onChange('formato', '9:16')}
        >
          <View style={styles.formatIconWrap}>
            <Ionicons
              name="phone-portrait-outline"
              size={24}
              color={COLORS.copper}
            />
            <Text style={styles.formatRatio}>9:16</Text>
          </View>
          <Text style={styles.formatLabel}>VÍDEO CURTO</Text>
          <Text style={styles.formatSub}>(Shorts, Reels, TikTok)</Text>
        </TouchableOpacity>
      </View>

      <Text style={styles.sectionTitle}>CAPTAÇÃO DO VÍDEO</Text>
      <View style={styles.captacaoCard}>
        <Text style={styles.captacaoText}>
          Deseja que eu faça a captação do bruto?
        </Text>
        <Switch
          value={data.captacao}
          onValueChange={(v) => onChange('captacao', v)}
          trackColor={{ false: COLORS.toggleOff, true: COLORS.copper }}
          thumbColor={COLORS.white}
        />
      </View>

      {data.captacao && (
        <View style={styles.localSection}>
          <Text style={styles.localLabel}>Se sim, onde será a captação?</Text>
          <View style={styles.localInput}>
            <Ionicons
              name="location-outline"
              size={18}
              color={COLORS.copper}
            />
            <TextInput
              style={styles.localTextInput}
              placeholder="Ex: Escritório, evento, externa, estúdio..."
              placeholderTextColor={COLORS.textMuted}
              value={data.localCaptacao}
              onChangeText={(v) => onChange('localCaptacao', v)}
            />
          </View>
        </View>
      )}

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
    marginBottom: 16,
    lineHeight: 18,
  },
  section: {
    marginBottom: 20,
  },
  estiloCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: COLORS.cardBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 12,
    padding: 12,
    marginBottom: 10,
  },
  estiloCardActive: {
    borderColor: COLORS.copper,
    backgroundColor: 'rgba(196,129,61,0.1)',
  },
  estiloImagePlaceholder: {
    width: 60,
    height: 60,
    borderRadius: 10,
    backgroundColor: COLORS.inputBg,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  estiloInfo: {
    flex: 1,
  },
  estiloNome: {
    fontSize: 14,
    fontWeight: 'bold',
    color: COLORS.copper,
    letterSpacing: 1,
    marginBottom: 2,
  },
  estiloDesc: {
    fontSize: 11,
    color: COLORS.textSecondary,
    lineHeight: 15,
  },
  sectionTitle: {
    fontSize: 13,
    fontWeight: '700',
    color: COLORS.copper,
    letterSpacing: 1.5,
    marginBottom: 12,
    textTransform: 'uppercase',
  },
  formatRow: {
    flexDirection: 'row',
    gap: 10,
    marginBottom: 20,
  },
  formatCard: {
    flex: 1,
    backgroundColor: COLORS.cardBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 12,
    padding: 14,
    alignItems: 'center',
  },
  formatCardActive: {
    borderColor: COLORS.copper,
    backgroundColor: 'rgba(196,129,61,0.1)',
  },
  formatIconWrap: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 6,
    gap: 6,
  },
  formatRatio: {
    fontSize: 18,
    fontWeight: 'bold',
    color: COLORS.white,
  },
  formatLabel: {
    fontSize: 11,
    fontWeight: '700',
    color: COLORS.white,
    letterSpacing: 0.5,
  },
  formatSub: {
    fontSize: 10,
    color: COLORS.textMuted,
    marginTop: 2,
  },
  captacaoCard: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    backgroundColor: COLORS.cardBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 12,
    padding: 14,
    marginBottom: 12,
  },
  captacaoText: {
    fontSize: 13,
    color: COLORS.white,
    flex: 1,
    marginRight: 10,
  },
  localSection: {
    marginBottom: 10,
  },
  localLabel: {
    fontSize: 12,
    color: COLORS.textSecondary,
    marginBottom: 8,
  },
  localInput: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: COLORS.inputBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 10,
    paddingHorizontal: 12,
    paddingVertical: 10,
  },
  localTextInput: {
    flex: 1,
    color: COLORS.white,
    fontSize: 13,
    marginLeft: 8,
  },
});
