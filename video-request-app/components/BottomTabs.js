import React from 'react';
import { View, TouchableOpacity, Text, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { COLORS } from '../theme';

const TABS = [
  { key: 0, label: 'INFORMAÇÕES', icon: 'person-outline' },
  { key: 1, label: 'ESTILO', icon: 'color-palette-outline' },
  { key: 2, label: 'NECESSIDADES', icon: 'list-outline' },
  { key: 3, label: 'BUDGET', icon: 'wallet-outline' },
  { key: 4, label: 'FINALIZAÇÃO', icon: 'checkmark-circle-outline' },
];

export default function BottomTabs({ currentStep, onChangeStep }) {
  return (
    <View style={styles.container}>
      {TABS.map((tab) => {
        const active = currentStep === tab.key;
        return (
          <TouchableOpacity
            key={tab.key}
            style={styles.tab}
            onPress={() => onChangeStep(tab.key)}
          >
            <Ionicons
              name={tab.icon}
              size={20}
              color={active ? COLORS.tabActive : COLORS.tabInactive}
            />
            <Text
              style={[
                styles.label,
                { color: active ? COLORS.tabActive : COLORS.tabInactive },
              ]}
              numberOfLines={1}
            >
              {tab.label}
            </Text>
          </TouchableOpacity>
        );
      })}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    backgroundColor: COLORS.cardBg,
    borderTopWidth: 1,
    borderTopColor: COLORS.border,
    paddingVertical: 8,
    paddingHorizontal: 4,
  },
  tab: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: 4,
  },
  label: {
    fontSize: 8,
    fontWeight: '600',
    marginTop: 2,
    letterSpacing: 0.3,
  },
});
