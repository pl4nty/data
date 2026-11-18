-- Threat: !InfrastructureShared
-- Name: ConversionToBinary_fastBinaryTransform
-- Type: 1

function fastBinaryTransform(l_1_0, l_1_1, l_1_2, l_1_3)
  local l_1_4 = {}
  
  local l_1_5
  local l_1_6 = string.char
  for l_1_7 = 0, 255 do
    l_1_4[l_1_6(l_1_3(l_1_2, l_1_7))] = l_1_6(l_1_7)
  end
  return l_1_0:gsub(l_1_1, l_1_4)
end
