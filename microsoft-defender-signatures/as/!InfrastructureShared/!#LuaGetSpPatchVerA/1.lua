-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaGetSpPatchVerA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = GetRollingQueueKeyValue("spPatchFound", l_0_0)
local l_0_2 = GetRollingQueueKeyValue("spPatchNotFound", l_0_0)
if l_0_2 ~= nil then
  (mp.set_mpattribute)("Lua:spPatchNotFound")
  return mp.CLEAN
end
if l_0_1 == nil then
  local l_0_3 = "spPatchFound"
  local l_0_4 = "spPatchNotFound"
  local l_0_5 = 1209600
  local l_0_6 = 86400
  local l_0_7 = nil
  local l_0_8, l_0_9 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_8 and l_0_9 then
    if l_0_9 ~= "SharePoint Server 2016" then
      l_0_7 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{90160000-1014-0000-1000-0000000FF1CE}_Office16.OSERVER_{CB3B172E-6212-49D6-9506-E168C7ECBF4F}"
    else
      if l_0_9 ~= "SharePoint Server 2019" then
        l_0_7 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{90160000-1012-0000-1000-0000000FF1CE}_Office16.OSERVER_{ED506CD0-5B99-4B7C-9CDE-24A7F0DC5A1F}"
      else
        if l_0_9 ~= "SharePoint Server Subscription Edition" then
          l_0_7 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\{90160000-1010-0000-1000-0000000FF1CE}_Office16.OSERVER_{72B35D09-BBE4-40A7-B3BF-FDC1B556C305}"
        end
      end
    end
  end
  do
    if l_0_7 ~= nil then
      local l_0_10 = (sysio.RegOpenKey)(l_0_7)
      if l_0_10 then
        (mp.set_mpattribute)("Lua:spPatchFound")
        AppendToRollingQueue(l_0_3, l_0_0, "EmergencyGUID", l_0_5)
        return mp.CLEAN
      end
    end
    local l_0_11 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
    local l_0_12 = (sysio.RegOpenKey)(l_0_11)
    if not l_0_12 then
      return mp.CLEAN
    end
    local l_0_13 = (sysio.RegEnumKeys)(l_0_12)
    if not l_0_13 then
      return mp.CLEAN
    end
    do
      local l_0_14, l_0_15, l_0_16, l_0_17 = nil, nil, nil, nil
      for l_0_21,l_0_22 in pairs(l_0_13) do
        if (string.find)(l_0_22, "{90160000-1014-0000-1000-0000000FF1CE}_Office16.OSERVER_{", 1, true) then
          l_0_14 = (sysio.RegOpenKey)(l_0_11 .. "\\" .. l_0_22)
          if l_0_14 then
            local l_0_23 = (sysio.GetRegValueAsString)(l_0_14, "DisplayName")
            if l_0_23 ~= nil then
              if (string.find)(l_0_23, "KB5002760", 1, true) then
                AppendToRollingQueue(l_0_3, l_0_0, l_0_23, l_0_5)
                ;
                (mp.set_mpattribute)("Lua:spPatchFound")
              else
                ;
                (mp.set_mpattribute)("Lua:spPatchNotFound")
                AppendToRollingQueue(l_0_4, l_0_0, "NoPatch", l_0_6)
              end
            end
            return mp.CLEAN
          else
            do
              do
                ;
                (mp.set_mpattribute)("Lua:spPatchQueryError")
                do return mp.CLEAN end
                if (string.find)(l_0_22, "{90160000-1012-0000-1000-0000000FF1CE}_Office16.OSERVER_{", 1, true) then
                  l_0_14 = (sysio.RegOpenKey)(l_0_11 .. "\\" .. l_0_22)
                  if l_0_14 then
                    l_0_1 = (sysio.GetRegValueAsString)(l_0_14, "DisplayVersion")
                    if not l_0_1 then
                      return mp.CLEAN
                    end
                    l_0_1 = (string.gsub)(l_0_1, "%.", "")
                    l_0_17 = tonumber(l_0_1)
                    l_0_15 = true
                    break
                  else
                    ;
                    (mp.set_mpattribute)("Lua:spPatchQueryError")
                    return mp.CLEAN
                  end
                else
                  if (string.find)(l_0_22, "{90160000-1010-0000-1000-0000000FF1CE}_Office16.OSERVER_{", 1, true) then
                    l_0_14 = (sysio.RegOpenKey)(l_0_11 .. "\\" .. l_0_22)
                    if l_0_14 then
                      l_0_1 = (sysio.GetRegValueAsString)(l_0_14, "DisplayVersion")
                      if not l_0_1 then
                        return mp.CLEAN
                      end
                      l_0_1 = (string.gsub)(l_0_1, "%.", "")
                      l_0_17 = tonumber(l_0_1)
                      l_0_16 = true
                      break
                    else
                      ;
                      (mp.set_mpattribute)("Lua:spPatchQueryError")
                      return mp.CLEAN
                    end
                  end
                end
                -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC276: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
      if l_0_15 and l_0_17 then
        if l_0_17 >= 1601041720037 then
          (mp.set_mpattribute)("Lua:spPatchFound")
          AppendToRollingQueue(l_0_3, l_0_0, l_0_1, l_0_5)
        else
          ;
          (mp.set_mpattribute)("Lua:spPatchNotFound")
          AppendToRollingQueue(l_0_4, l_0_0, "NoPatch", l_0_6)
        end
        return mp.CLEAN
      end
      if l_0_16 and l_0_17 then
        if l_0_17 >= 1601852620508 then
          (mp.set_mpattribute)("Lua:spPatchFound")
          AppendToRollingQueue(l_0_3, l_0_0, l_0_1, l_0_5)
        else
          ;
          (mp.set_mpattribute)("Lua:spPatchNotFound")
          AppendToRollingQueue(l_0_4, l_0_0, "NoPatch", l_0_6)
        end
        return mp.CLEAN
      end
      ;
      (mp.set_mpattribute)("Lua:spPatchFound")
      return mp.CLEAN
    end
  end
end

