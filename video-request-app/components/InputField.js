import React from 'react';
import { View, TextInput, Text, StyleSheet } from 'react-native';
import { Ionicons } from '@expo/vector-icons';
import { COLORS } from '../theme';

export default function InputField({
  icon,
  label,
  placeholder,
  value,
  onChangeText,
  keyboardType,
  optional,
}) {
  return (
    <View style={styles.container}>
      <View style={styles.iconRow}>
        <Ionicons name={icon} size={18} color={COLORS.copper} />
        <Text style={styles.label}>
          {label}
          {optional && <Text style={styles.optional}> (opcional)</Text>}
        </Text>
      </View>
      <TextInput
        style={styles.input}
        placeholder={placeholder}
        placeholderTextColor={COLORS.textMuted}
        value={value}
        onChangeText={onChangeText}
        keyboardType={keyboardType || 'default'}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    marginBottom: 14,
  },
  iconRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 6,
  },
  label: {
    fontSize: 13,
    color: COLORS.white,
    marginLeft: 8,
    fontWeight: '500',
  },
  optional: {
    color: COLORS.textMuted,
    fontSize: 12,
    fontWeight: '400',
  },
  input: {
    backgroundColor: COLORS.inputBg,
    borderWidth: 1,
    borderColor: COLORS.border,
    borderRadius: 10,
    paddingHorizontal: 14,
    paddingVertical: 12,
    color: COLORS.white,
    fontSize: 14,
  },
});
