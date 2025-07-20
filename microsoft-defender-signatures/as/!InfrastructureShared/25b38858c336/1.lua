-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\25b38858c336\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = ((bm.get_imagepath)())
local l_0_1 = nil
if not l_0_0 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_2 = GetRollingQueueKeyValue("SpPatchVersion", l_0_0)
if l_0_2 == nil then
  local l_0_3 = "SpPatchVersion"
  local l_0_4 = 86400
  local l_0_5 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall"
  local l_0_6 = (sysio.RegOpenKey)(l_0_5)
  if not l_0_6 then
    return mp.CLEAN
  end
  local l_0_7 = (sysio.RegEnumKeys)(l_0_6)
  if not l_0_7 then
    return mp.CLEAN
  end
  for l_0_11,l_0_12 in pairs(l_0_7) do
    if (string.find)(l_0_12, "{90160000-1012-0000-1000-0000000FF1CE}_Office16.OSERVER_", 1, true) or (string.find)(l_0_12, "{90160000-1010-0000-1000-0000000FF1CE}_Office16.OSERVER_", 1, true) or (string.find)(l_0_12, "{90160000-1014-0000-1000-0000000FF1CE}_Office16.OSERVER_", 1, true) then
      do
        do
          local l_0_13 = (sysio.RegOpenKey)(l_0_5 .. "\\" .. l_0_12)
          if l_0_13 then
            l_0_2 = (sysio.GetRegValueAsString)(l_0_13, "DisplayVersion")
            if l_0_2 ~= nil then
              AppendToRollingQueue(l_0_3, l_0_0, l_0_2, l_0_4)
              ;
              (bm.add_related_string)("SpPatchVersion", l_0_2, bm.RelatedStringBMReport)
              do return mp.INFECTED end
              break
            end
            l_0_1 = (sysio.GetRegValueAsString)(l_0_13, "DisplayName")
            if l_0_1 ~= nil then
              AppendToRollingQueue(l_0_3, l_0_0, l_0_1, l_0_4)
              ;
              (bm.add_related_string)("SpPatchVersion", l_0_1, bm.RelatedStringBMReport)
              return mp.INFECTED
            end
          end
          do break end
          -- DECOMPILER ERROR at PC131: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC131: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC131: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
else
  do
    ;
    (bm.add_related_string)("SpPatchVersion", l_0_2, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end

