import React from 'react';
import {
  View,
  Text,
  ScrollView,
  StyleSheet,
  Image,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { COLORS } from '../theme';
import InputField from '../components/InputField';

export default function InformacoesScreen({ data, onChange }) {
  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <View style={styles.heroSection}>
        <View style={styles.clapperIcon}>
          <Ionicons name="videocam" size={48} color={COLORS.copper} />
        </View>
        <Text style={styles.title}>VAMOS{'\n'}COMEÇAR!</Text>
        <Text style={styles.subtitle}>
          Preencha seus dados para{'\n'}iniciarmos seu projeto.
        </Text>
      </View>

      <View style={styles.form}>
        <InputField
          icon="person-outline"
          label="Nome completo"
          placeholder="Digite seu nome"
          value={data.nome}
          onChangeText={(v) => onChange('nome', v)}
        />
        <InputField
          icon="mail-outline"
          label="E-mail"
          placeholder="Digite seu e-mail"
          value={data.email}
          onChangeText={(v) => onChange('email', v)}
          keyboardType="email-address"
        />
        <InputField
          icon="logo-whatsapp"
          label="WhatsApp"
          placeholder="(00) 00000-0000"
          value={data.whatsapp}
          onChangeText={(v) => onChange('whatsapp', v)}
          keyboardType="phone-pad"
          optional
        />
        <InputField
          icon="link-outline"
          label="Link do canal ou perfil"
          placeholder="Ex: youtube.com/seucanal"
          value={data.linkCanal}
          onChangeText={(v) => onChange('linkCanal', v)}
          optional
        />

        <View style={styles.publishSection}>
          <View style={styles.publishHeader}>
            <Ionicons name="globe-outline" size={18} color={COLORS.copper} />
            <Text style={styles.publishLabel}>
              Onde deseja publicar seu vídeo?
            </Text>
          </View>
          <View style={styles.publishOptions}>
            {['YouTube', 'Instagram', 'TikTok', 'Outro'].map((opt) => {
              const selected = data.plataforma === opt;
              return (
                <View
                  key={opt}
                  style={[
                    styles.publishChip,
                    selected && styles.publishChipActive,
                  ]}
                >
                  <Text
                    style={[
                      styles.publishChipText,
                      selected && styles.publishChipTextActive,
                    ]}
                    onPress={() => onChange('plataforma', opt)}
                  >
                    {opt}
                  </Text>
                </View>
              );
            })}
          </View>
        </View>
      </View>

      <View style={{ height: 30 }} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  heroSection: {
    alignItems: 'center',
    paddingTop: 10,
    paddingBottom: 20,
  },
  clapperIcon: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: COLORS.cardBg,
    borderWidth: 1.5,
    borderColor: COLORS.copper,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 16,
  },
  title: {
    fontSize: 28,
    fontWeight: 'bold',
    color: COLORS.copper,
    textAlign: 'center',
    letterSpacing: 3,
    lineHeight: 36,
  },
  subtitle: {
    fontSize: 13,
    color: COLORS.textSecondary,
    textAlign: 'center',
    marginTop: 8,
    lineHeight: 18,
  },
  form: {
    paddingHorizontal: 20,
  },
  publishSection: {
    marginTop: 4,
  },
  publishHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 10,
  },
  publishLabel: {
    fontSize: 13,
    color: COLORS.white,
    marginLeft: 8,
    fontWeight: '500',
  },
  publishOptions: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
  },
  publishChip: {
    backgroundColor: COLORS.inputBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 20,
    paddingHorizontal: 16,
    paddingVertical: 8,
  },
  publishChipActive: {
    borderColor: COLORS.copper,
    backgroundColor: 'rgba(196,129,61,0.15)',
  },
  publishChipText: {
    fontSize: 13,
    color: COLORS.textMuted,
  },
  publishChipTextActive: {
    color: COLORS.copper,
    fontWeight: '600',
  },
});
