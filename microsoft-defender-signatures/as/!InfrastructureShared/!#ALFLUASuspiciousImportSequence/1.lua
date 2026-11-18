-- Threat: !InfrastructureShared
-- Name: !#ALF:LUA:SuspiciousImportSequence
-- Type: 8
-- MpAttributes: BM_MZ_FILE & !pea_ismsil & !pea_no_iat & RPF:TopLevelFile

local l_0_0, l_0_1 = pe.get_imports()
if l_0_1 == nil or l_0_0 < 8 then
  return mp.CLEAN
end
local l_0_2 = {
  [3582934083] = {
    [150799487] = {
      [689456874] = {
        [2744197095] = {
          [836405768] = {true, "Rhysida"}
        }
      }
    }
  }
}
for l_0_3 = 1, l_0_0 do
  if l_0_2[l_0_1[l_0_3].fn] ~= nil then
    local l_0_4 = l_0_2
    for l_0_5 = 0, l_0_0 - l_0_3 do
      l_0_4 = l_0_4[l_0_1[l_0_3 + l_0_5].fn]
      if l_0_4 == nil then
        break
      elseif l_0_4[1] == true then
        if l_0_4[2] ~= nil then
          mp.set_mpattribute("ImportSequenceSignature_" .. l_0_4[2])
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
