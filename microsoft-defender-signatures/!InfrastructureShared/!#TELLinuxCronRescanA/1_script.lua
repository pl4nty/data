-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELLinuxCronRescanA\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_0 == nil or #l_0_0 < 10 then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC17: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC18: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

for l_0_5,l_0_6 in ("/etc/cron")("/etc/crontab") do
  if (string.match)(l_0_0, l_0_6) then
    local l_0_7 = tostring(headerpage)
    if l_0_7 == nil then
      return mp.CLEAN
    end
    for l_0_11 in (string.gmatch)(l_0_7, "/[^%s]+") do
      if (sysio.IsFileExists)(l_0_11) then
        (mp.ReportLowfi)(l_0_11, 215366885)
        if (string.match)(l_0_11, "/%.") then
          (mp.ReportLowfi)(l_0_11, 34864475)
        end
      end
    end
    return mp.INFECTED
  end
end
return mp.CLEAN

