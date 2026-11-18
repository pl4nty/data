-- Threat: !InfrastructureShared
-- Name: 92b3f43fb630
-- Type: 21
-- Includes: TechniqueTracker, LuaFuncHelper

local l_0_0 = false
local l_0_1 = GetRollingQueue("PoshevinRelatedFiles")
if l_0_1 ~= nil and type(l_0_1) == "table" then
  for l_0_2 in pairs(l_0_1) do
    local l_0_3 = tostring(l_0_1[l_0_2].key)
    local l_0_4 = l_0_3:match("\\.-(%..+)$")
    if l_0_4 and 4 < #l_0_4 then
      local l_0_5 = sysio.RegExpandUserKey("HKCU\\Software\\Classes")
      for l_0_6, l_0_7 in pairs(l_0_5) do
        local l_0_8 = l_0_7 .. "\\" .. l_0_4
        local l_0_9 = sysio.RegOpenKey(l_0_8)
        if l_0_9 then
          local l_0_10 = sysio.GetRegValueAsString(l_0_9, "")
          if l_0_10 then
            local l_0_11 = l_0_7 .. "\\" .. l_0_10
            local l_0_12 = l_0_11 .. "\\shell\\open\\command"
            local l_0_13 = sysio.RegOpenKey(l_0_12)
            local l_0_14 = sysio.GetRegValueAsString(l_0_13, "")
            if l_0_14 then
              local l_0_15 = string.lower(l_0_14)
              if l_0_15:match("powershell.+aescrypto.+base64") then
                l_0_0 = true
              end
            end
            if l_0_0 then
              AppendToRollingQueue("PoshevinRelatedRegistries", l_0_11, nil, 5000)
              AppendToRollingQueue("PoshevinRelatedRegistries", l_0_8, nil, 5000)
            end
          end
        end
      end
    end
  end
end
if l_0_0 then
  AddResearchData("BM", true)
  return mp.INFECTED
end
return mp.CLEAN
