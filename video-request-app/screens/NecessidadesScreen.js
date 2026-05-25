import React from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  TextInput,
  StyleSheet,
} from 'react-native';
import { Ionicons, MaterialCommunityIcons } from '@expo/vector-icons';
import { COLORS } from '../theme';

const NECESSIDADES = [
  {
    id: 'legendas',
    nome: 'LEGENDAS',
    desc: 'Legendas dinâmicas e personalizadas.',
    icon: 'subtitles-outline',
  },
  {
    id: 'vfx',
    nome: 'EFEITOS ESPECIAIS (VFX)',
    desc: 'Efeitos visuais e composição.',
    icon: 'auto-fix',
  },
  {
    id: 'sfx',
    nome: 'EFEITOS SONOROS (SFX)',
    desc: 'Sons que deixam tudo mais imersivo.',
    icon: 'surround-sound',
  },
  {
    id: 'colorGrading',
    nome: 'COLOR GRADING',
    desc: 'Correção de cor e tratamento visual.',
    icon: 'palette-outline',
  },
  {
    id: 'motionGraphics',
    nome: 'MOTION GRAPHICS',
    desc: 'Elementos animados e gráficos.',
    icon: 'animation-play-outline',
  },
  {
    id: 'transicoes',
    nome: 'TRANSIÇÕES PREMIUM',
    desc: 'Transições modernas e criativas.',
    icon: 'transition',
  },
  {
    id: 'animacoesTexto',
    nome: 'ANIMAÇÕES DE TEXTO',
    desc: 'Textos animados com estilo.',
    icon: 'format-text-rotation-none',
  },
  {
    id: 'outros',
    nome: 'OUTROS',
    desc: 'Conte sobre outras necessidades.',
    icon: 'dots-horizontal-circle-outline',
  },
];

export default function NecessidadesScreen({ data, onChange }) {
  const toggleNecessidade = (id) => {
    const current = data.necessidades || [];
    if (current.includes(id)) {
      onChange(
        'necessidades',
        current.filter((n) => n !== id)
      );
    } else {
      onChange('necessidades', [...current, id]);
    }
  };

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      <Text style={styles.title}>
        O QUE VOCÊ PRECISA{'\n'}NO SEU VÍDEO?
      </Text>
      <Text style={styles.subtitle}>
        Selecione os recursos que fazem{'\n'}sentido para o seu projeto.
      </Text>

      <View style={styles.list}>
        {NECESSIDADES.map((item) => {
          const selected = (data.necessidades || []).includes(item.id);
          return (
            <TouchableOpacity
              key={item.id}
              style={[styles.card, selected && styles.cardActive]}
              onPress={() => toggleNecessidade(item.id)}
              activeOpacity={0.7}
            >
              <View style={styles.cardIcon}>
                <MaterialCommunityIcons
                  name={item.icon}
                  size={22}
                  color={COLORS.copper}
                />
              </View>
              <View style={styles.cardInfo}>
                <Text style={styles.cardNome}>{item.nome}</Text>
                <Text style={styles.cardDesc}>{item.desc}</Text>
              </View>
              <View
                style={[styles.checkbox, selected && styles.checkboxActive]}
              >
                {selected && (
                  <Ionicons name="checkmark" size={14} color={COLORS.white} />
                )}
              </View>
            </TouchableOpacity>
          );
        })}
      </View>

      <View style={styles.refSection}>
        <Text style={styles.refTitle}>LINK DE REFERÊNCIA (OPCIONAL)</Text>
        <Text style={styles.refSubtitle}>
          Envie um vídeo de referência para eu entender{'\n'}melhor o que você
          deseja.
        </Text>
        <View style={styles.refInput}>
          <Ionicons name="link-outline" size={18} color={COLORS.copper} />
          <TextInput
            style={styles.refTextInput}
            placeholder="Cole o link aqui (YouTube, Vimeo, etc.)"
            placeholderTextColor={COLORS.textMuted}
            value={data.linkReferencia}
            onChangeText={(v) => onChange('linkReferencia', v)}
          />
        </View>
      </View>

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
    fontSize: 24,
    fontWeight: 'bold',
    color: COLORS.copper,
    letterSpacing: 2,
    lineHeight: 32,
    marginTop: 8,
  },
  subtitle: {
    fontSize: 13,
    color: COLORS.textSecondary,
    marginTop: 6,
    marginBottom: 16,
    lineHeight: 18,
  },
  list: {
    marginBottom: 20,
  },
  card: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: COLORS.cardBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 12,
    padding: 12,
    marginBottom: 8,
  },
  cardActive: {
    borderColor: COLORS.copper,
    backgroundColor: 'rgba(196,129,61,0.1)',
  },
  cardIcon: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: COLORS.inputBg,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 12,
  },
  cardInfo: {
    flex: 1,
  },
  cardNome: {
    fontSize: 12,
    fontWeight: 'bold',
    color: COLORS.copper,
    letterSpacing: 0.8,
    marginBottom: 1,
  },
  cardDesc: {
    fontSize: 11,
    color: COLORS.textSecondary,
  },
  checkbox: {
    width: 24,
    height: 24,
    borderRadius: 6,
    borderWidth: 1.5,
    borderColor: COLORS.border,
    justifyContent: 'center',
    alignItems: 'center',
  },
  checkboxActive: {
    backgroundColor: COLORS.copper,
    borderColor: COLORS.copper,
  },
  refSection: {
    backgroundColor: COLORS.cardBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 12,
    padding: 14,
  },
  refTitle: {
    fontSize: 12,
    fontWeight: '700',
    color: COLORS.copper,
    letterSpacing: 1,
    marginBottom: 4,
  },
  refSubtitle: {
    fontSize: 11,
    color: COLORS.textSecondary,
    marginBottom: 10,
    lineHeight: 16,
  },
  refInput: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: COLORS.inputBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 10,
    paddingHorizontal: 12,
    paddingVertical: 10,
  },
  refTextInput: {
    flex: 1,
    color: COLORS.white,
    fontSize: 12,
    marginLeft: 8,
  },
});
