-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\adb306ff31a9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (MpCommon.GetProcessProtection)(l_0_0.ppid)
if l_0_1 and l_0_1 == 0 then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 then
  l_0_3 = (this_sigattrlog[1]).utf8p1
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p1 then
    l_0_3 = (this_sigattrlog[2]).utf8p1
  else
    if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 then
      l_0_3 = (this_sigattrlog[3]).utf8p1
    else
      if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 then
        l_0_3 = (this_sigattrlog[4]).utf8p1
      end
    end
  end
end
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = (mp.GetParentProcInfo)()
if l_0_4 and l_0_4.ppid then
  local l_0_5, l_0_6 = (MpCommon.GetProcessProtection)(l_0_4.ppid)
  if l_0_4.image_path then
    do
      if not (l_0_4.image_path):match("([^\\]+)$") then
        local l_0_7, l_0_9 = not l_0_5 or l_0_5 ~= 0 or ""
      end
      do
        local l_0_8 = nil
        -- DECOMPILER ERROR at PC129: Confused about usage of register: R7 in 'UnsetPending'

        if (mp.IsKnownFriendlyFile)(l_0_4.image_path, true, false) and (string.lower)(l_0_3:match("([^\\]+)$") or "") == (string.lower)(l_0_8) then
          return mp.CLEAN
        end
        ;
        (bm.add_related_string)("PPlProcessCreated", l_0_3, bm.RelatedStringBMReport)
        local l_0_10 = bm.add_related_string
        local l_0_11 = "PPlLevel"
        local l_0_12 = l_0_5
        local l_0_13 = "_"
        do
          do
            l_0_12 = l_0_12 .. l_0_13 .. (l_0_2 or "Error")
            l_0_13 = bm
            l_0_13 = l_0_13.RelatedStringBMReport
            l_0_10(l_0_11, l_0_12, l_0_13)
            l_0_10 = add_parents
            l_0_10()
            l_0_10 = mp
            l_0_10 = l_0_10.INFECTED
            do return l_0_10 end
            do return mp.CLEAN end
            -- DECOMPILER ERROR at PC163: freeLocal<0 in 'ReleaseLocals'

          end
        end
      end
    end
  end
end

