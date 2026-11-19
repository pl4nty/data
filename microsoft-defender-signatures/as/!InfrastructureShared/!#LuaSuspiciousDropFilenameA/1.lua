-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousDropFilename.A
-- Type: 8

function is_vowel(l_1_0)
  return l_1_0 == 97 or l_1_0 == 101 or l_1_0 == 105 or l_1_0 == 111 or l_1_0 == 117
end

function is_alpha(l_2_0)
  return 97 <= l_2_0 and l_2_0 <= 122 or 74 <= l_2_0 and l_2_0 <= 90
end

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  local l_0_2 = string.len(l_0_1) - 4
  if l_0_2 ~= 6 or string.sub(l_0_1, -4) ~= ".exe" then
    return mp.CLEAN
  end
  local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.sub(l_0_3, -17) == "\\application data" or string.sub(l_0_3, -16) == "\\appdata\\roaming" then
    for l_0_4 = 1, l_0_2 do
      local l_0_5 = string.byte(l_0_1, l_0_4)
      if not is_alpha(l_0_5) or is_vowel(l_0_5) then
        return mp.CLEAN
      end
    end
    mp.set_mpattribute("Lua:SuspiciousDropFilename.A")
    return mp.INFECTED
  end
end
return mp.CLEAN
