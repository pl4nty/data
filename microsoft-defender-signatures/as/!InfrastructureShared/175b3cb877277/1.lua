-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\175b3cb877277\1.luac 

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
if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p1 then
  l_0_3 = (this_sigattrlog[4]).utf8p1
else
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 then
    l_0_3 = (this_sigattrlog[5]).utf8p1
  else
    if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 then
      l_0_3 = (this_sigattrlog[6]).utf8p1
    else
      if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 then
        l_0_3 = (this_sigattrlog[7]).utf8p1
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
        local l_0_7, l_0_9, l_0_10 = not l_0_5 or l_0_5 ~= 0 or ""
      end
      do
        local l_0_8, l_0_11 = , l_0_3:match("([^\\]+)$") or ""
        -- DECOMPILER ERROR at PC125: Confused about usage of register: R8 in 'UnsetPending'

        -- DECOMPILER ERROR at PC129: Confused about usage of register: R7 in 'UnsetPending'

        if (mp.IsKnownFriendlyFile)(l_0_4.image_path, true, false) and (string.lower)(l_0_11) == (string.lower)(l_0_8) then
          return mp.CLEAN
        end
        local l_0_12 = nil
        local l_0_13 = nil
        local l_0_14 = checkParentCmdlineCaseInsensitive
        do
          local l_0_15 = l_0_0.ppid
          l_0_14 = l_0_14(l_0_15, {
{"svchost", "WerSvcGroup"}
}, 3)
          if l_0_14 then
            l_0_14 = mp
            l_0_14 = l_0_14.CLEAN
            return l_0_14
          end
          l_0_14 = bm
          l_0_14 = l_0_14.add_related_string
          l_0_15 = "PPlProcessParent"
          l_0_14(l_0_15, l_0_4.image_path, bm.RelatedStringBMReport)
          local l_0_16 = bm.add_related_string
          local l_0_17 = "PPlLevel"
          local l_0_18 = l_0_5
          local l_0_19 = "_"
          do
            do
              l_0_18 = l_0_18 .. l_0_19 .. (l_0_2 or "Error")
              l_0_19 = bm
              l_0_19 = l_0_19.RelatedStringBMReport
              l_0_16(l_0_17, l_0_18, l_0_19)
              l_0_16 = add_parents
              l_0_16()
              l_0_16 = mp
              l_0_16 = l_0_16.INFECTED
              do return l_0_16 end
              do return mp.CLEAN end
              -- DECOMPILER ERROR at PC178: freeLocal<0 in 'ReleaseLocals'

            end
          end
        end
      end
    end
  end
end

