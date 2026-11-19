-- Threat: !InfrastructureShared
-- Name: ConversionToBinary_fastDec2BinWithKey
-- Type: 1

local function l_0_0(l_1_0, l_1_1)
  local l_1_2 = {
    __index = function()
      return l_1_1
    end
  }
  setmetatable(l_1_0, l_1_2)
end

function fastDec2BinWithKey(l_3_0, l_3_1, l_3_2, l_3_3)
  local l_3_4 = {}
  local l_3_5 = string.char
  for l_3_6 = 0, 255 do
    l_3_4[tostring(l_3_3(l_3_2, l_3_6))] = l_3_5(l_3_6)
  end
  l_0_0(l_3_4, " ")
  return l_3_0:gsub(l_3_1, l_3_4)
end
