-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ebd7cea9c239\0x0000c395_luac 

-- params : ...
-- function num : 0
local l_0_0 = (sysio.RegExpandUserKey)("HKCU\\Software\\Classes\\ms-settings\\CurVer")
if l_0_0 then
  for l_0_4,l_0_5 in pairs(l_0_0) do
    if (string.find)((string.lower)(l_0_5), "hkcu@s-1-5-21-", 1, true) then
      local l_0_6 = (sysio.RegOpenKey)(l_0_5)
      if l_0_6 then
        local l_0_7 = (sysio.GetRegValueAsString)(l_0_6, "")
        if l_0_7 then
          local l_0_8 = (string.match)(l_0_5, "(HKCU.-)\\")
          if l_0_8 then
            local l_0_9 = l_0_8 .. "\\Software\\Classes\\" .. l_0_7 .. "\\shell\\open\\command"
            local l_0_10 = (sysio.RegOpenKey)(l_0_9)
            if l_0_10 then
              local l_0_11 = (sysio.GetRegValueAsString)(l_0_10, "")
              if l_0_11 then
                if (string.len)(l_0_11) < 4 and (string.lower)(l_0_11) ~= "cmd" then
                  return mp.CLEAN
                end
                set_research_data("DefaultValue", l_0_11, false)
                local l_0_12 = {}
                ;
                (table.insert)(l_0_12, l_0_11)
                ;
                (MpCommon.SetPersistContextNoPath)("UACBypassRegSetData", l_0_12, 5)
                local l_0_13 = (mp.GetScannedPPID)()
                local l_0_14 = {}
                ;
                (table.insert)(l_0_14, l_0_13)
                ;
                (MpCommon.SetPersistContextNoPath)("UACBypassRegSet.A", l_0_14, 5)
                ;
                (mp.set_mpattribute)("MpDisableCaching")
                return mp.INFECTED
              end
            end
          end
        end
      end
    end
  end
end
do
  return mp.CLEAN
end

