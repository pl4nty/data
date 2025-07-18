-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\SuspNetSupport\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = Remediation.Threat
if l_0_0.Active and (string.match)(l_0_0.Name, "Behavior:Win32/SuspNetSupport.C") then
  for l_0_4,l_0_5 in ipairs((Remediation.Threat).Resources) do
    if l_0_5.Schema == "behavior" then
      local l_0_6 = (string.lower)((string.match)(l_0_5.Path, "process: (%a:\\[^,]+%.exe)"))
      if l_0_6 then
        local l_0_7 = (sysio.RegExpandUserKey)("HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run")
        if l_0_7 then
          for l_0_11,l_0_12 in pairs(l_0_7) do
            if (string.find)((string.lower)(l_0_12), "hkcu@s-1-5-21-", 1, true) then
              local l_0_13 = (sysio.RegOpenKey)(l_0_12)
              if l_0_13 then
                local l_0_14 = (sysio.RegEnumValues)(l_0_13)
                for l_0_18,l_0_19 in pairs(l_0_14) do
                  local l_0_20 = (string.lower)((sysio.GetRegValueAsString)(l_0_13, l_0_19))
                  if l_0_20 and l_0_20 == l_0_6 then
                    (sysio.DeleteRegValue)(l_0_13, l_0_19)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC90: Confused about usage of register R4 for local variables in 'ReleaseLocals'

end

