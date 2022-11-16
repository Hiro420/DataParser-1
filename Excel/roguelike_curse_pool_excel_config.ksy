meta:
  id: roguelike_curse_pool_excel_config
  endian: le
  license: AGPL-3.0-or-later
  imports:
    - ../aux_types
seq:
  - id: bit_field
    type: aux_types::length_prefixed_bitfield
  - id: sequence_id
    type: aux_types::vlq_base128_le_u
    if: has_field_sequence_id
  - id: pool_id
    type: aux_types::vlq_base128_le_u
    if: has_field_pool_id
  - id: group_id
    type: aux_types::vlq_base128_le_u
    if: has_field_group_id
instances:
  has_field_sequence_id: # Field №0
    value: (bit_field.length.value >= 1) and ((bit_field.bitfield[0] & 0b00000001) != 0)
  has_field_pool_id: # Field №1
    value: (bit_field.length.value >= 1) and ((bit_field.bitfield[0] & 0b00000010) != 0)
  has_field_group_id: # Field №2
    value: (bit_field.length.value >= 1) and ((bit_field.bitfield[0] & 0b00000100) != 0)
