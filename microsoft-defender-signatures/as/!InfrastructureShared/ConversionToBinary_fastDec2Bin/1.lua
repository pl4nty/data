-- Threat: !InfrastructureShared
-- Name: ConversionToBinary_fastDec2Bin
-- Type: 1

local function l_0_0(l_1_0, l_1_1)
  local l_1_2 = {
    __index = function()
      return l_1_1
    end
  }
  setmetatable(l_1_0, l_1_2)
end

function fastDec2Bin(l_3_0, l_3_1)
  local l_3_2 = {}
  local l_3_3 = string.char
  for l_3_4 = 0, 255 do
    l_3_2[tostring(l_3_4)] = l_3_3(l_3_4)
  end
  l_0_0(l_3_2, " ")
  return l_3_0:gsub(l_3_1, l_3_2)
end
