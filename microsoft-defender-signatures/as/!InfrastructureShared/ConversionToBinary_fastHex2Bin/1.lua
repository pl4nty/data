-- Threat: !InfrastructureShared
-- Name: ConversionToBinary_fastHex2Bin
-- Type: 1

function fastHex2Bin(l_1_0, l_1_1)
  local l_1_2 = {}
  
  local l_1_3 = string.char
  local l_1_4 = string.format
  for l_1_5 = 0, 255 do
    l_1_2[l_1_4("%02X", l_1_5)] = l_1_3(l_1_5)
  end
  return l_1_0:upper():gsub(l_1_1, l_1_2)
end
