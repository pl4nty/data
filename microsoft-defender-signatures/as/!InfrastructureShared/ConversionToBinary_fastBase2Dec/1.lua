-- Threat: !InfrastructureShared
-- Name: ConversionToBinary_fastBase2Dec
-- Type: 1

function fastBase2Dec(l_1_0, l_1_1, l_1_2)
  if 36 < l_1_2 or l_1_2 < 2 then
    return nil
  end
  local l_1_3 = {}
  local l_1_4 = string.char
  local l_1_5 = {
    __index = function(l_2_0, l_2_1)
      local l_2_2 = l_1_4(tonumber(l_2_1, l_1_2))
      rawset(l_2_0, l_2_1, l_2_2)
      return l_2_2
    end
  }
  setmetatable(l_1_3, l_1_5)
  return l_1_0:upper():gsub(l_1_1, l_1_3)
end
