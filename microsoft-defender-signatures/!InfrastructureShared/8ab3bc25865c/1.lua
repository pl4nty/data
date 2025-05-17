-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8ab3bc25865c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "default|current|lastKnownGood"
local l_0_1, l_0_2 = nil, nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[2]).matched then
  l_0_1 = (string.lower)(((this_sigattrlog[3]).utf8p1):match("Select\\\\(%w+)"))
  if not (string.find)(l_0_0, l_0_1, 1, true) then
    return mp.CLEAN
  end
  l_0_2 = (this_sigattrlog[2]).p2
  if not l_0_2 then
    return mp.CLEAN
  end
else
  return mp.CLEAN
end
local l_0_3 = ((sysio.RegOpenKey)("HKLM\\SYSTEM\\Select"))
local l_0_4 = nil
if l_0_3 then
  l_0_4 = (sysio.GetRegValueAsDword)(l_0_3, l_0_1)
  l_0_4 = (string.format)("%03d", l_0_4)
end
local l_0_5 = "hklm\\system\\controlset" .. l_0_4 .. "\\SERVICES\\"
local l_0_6 = {}
l_0_6.windefend = "(c:\\\\programdata|%programfiles%)\\\\microsoft\\\\windows defender\\\\platform\\\\[\\d\\.-]+\\\\msmpeng.exe"
l_0_6.sense = "(c:\\\\program files|%programfiles%)\\\\windows defender advanced threat protection\\\\mssense.exe"
l_0_6.wdfilter = "(c:\\\\windows\\\\)?system32\\\\drivers\\\\wd\\\\wdfilter.sys"
l_0_6.wdboot = "(c:\\\\windows\\\\)?system32\\\\drivers\\\\wd\\\\wdboot.sys"
local l_0_7 = false
for l_0_11,l_0_12 in pairs(l_0_6) do
  local l_0_13 = l_0_5 .. l_0_11
  local l_0_14 = (sysio.RegOpenKey)(l_0_13)
  if l_0_14 then
    local l_0_15 = (sysio.GetRegValueAsString)(l_0_14, "ImagePath")
    l_0_15 = (string.lower)(l_0_15)
    if l_0_15 then
      local l_0_16, l_0_17 = (MpCommon.StringRegExpSearch)(l_0_12, l_0_15)
      if not l_0_16 then
        (bm.add_related_string)("Evidence", l_0_11 .. "|" .. l_0_15, bm.RelatedStringBMReport)
        l_0_7 = true
      end
    else
      do
        ;
        (bm.add_related_string)("Evidence", l_0_11 .. "|Empty", bm.RelatedStringBMReport)
        do return mp.INFECTED end
        do
          local l_0_18 = (sysio.GetRegValueAsDword)(l_0_14, "Start")
          if l_0_18 ~= 2 and l_0_18 ~= 0 then
            (bm.add_related_string)("Evidence", l_0_11 .. "|" .. l_0_18, bm.RelatedStringBMReport)
            l_0_7 = true
          end
          -- DECOMPILER ERROR at PC151: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC151: LeaveBlock: unexpected jumping out IF_ELSE_STMT

          -- DECOMPILER ERROR at PC151: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC151: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC151: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
end
if l_0_7 then
  local l_0_19 = tonumber(readRegDQwordValue(l_0_2), 16)
  if not l_0_19 then
    return mp.CLEAN
  end
  local l_0_20 = 1800
  local l_0_21 = 100
  AppendToRollingQueue("MpTamperRegKeyOldValues_ControlSet", l_0_1, l_0_19, l_0_20, l_0_21)
  return mp.INFECTED
end
do
  return mp.CLEAN
end

