-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousDropExeAttrib.C
-- Type: 9

function IsStrLower(l_1_0, l_1_1)
  if l_1_0 == nil or l_1_1 <= 0 or 128 < l_1_1 then
    return false
  end
  for l_1_2 = 1, l_1_1 do
    local l_1_3 = string.byte(l_1_0, l_1_2)
    if l_1_3 < 97 or 122 < l_1_3 then
      return false
    end
  end
  return true
end

function IsDofoilPath(l_2_0, l_2_1)
  return string.len(l_2_0) == 8 and string.len(l_2_1) == 12 and IsStrLower(l_2_0, 8) == true and IsStrLower(l_2_1, 8) == true
end

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
  if string.lower(l_0_1:sub(-25, -9)) == "\\appdata\\roaming\\" or string.lower(l_0_1:sub(-26, -9)) == "\\application data\\" then
    local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_ATTRIBUTES)
    if l_0_2 ~= 4294967295 then
      l_0_2 = mp.bitand(l_0_2, 3)
      if l_0_2 == 3 then
        mp.set_mpattribute("Lua:SuspiciousDropExeAttrib.C")
      elseif l_0_2 ~= 0 then
        if IsDofoilPath(l_0_1:sub(-8), mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)) == true then
          mp.set_mpattribute("Lua:DofoilFilename.A")
        end
        mp.set_mpattribute("Lua:SuspiciousDropExeAttrib.D")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
