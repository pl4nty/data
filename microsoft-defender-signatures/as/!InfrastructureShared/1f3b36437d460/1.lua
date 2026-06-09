-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1f3b36437d460\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched and not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[3]).matched and not isnull((this_sigattrlog[3]).utf8p1) then
  l_0_0 = (this_sigattrlog[3]).utf8p1
else
  if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p1) then
    l_0_0 = (this_sigattrlog[4]).utf8p1
  else
    if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p1) then
      l_0_0 = (this_sigattrlog[5]).utf8p1
    else
      if (this_sigattrlog[6]).matched and not isnull((this_sigattrlog[6]).utf8p1) then
        l_0_0 = (this_sigattrlog[6]).utf8p1
      else
        if (this_sigattrlog[7]).matched and not isnull((this_sigattrlog[7]).utf8p1) then
          l_0_0 = (this_sigattrlog[7]).utf8p1
        end
      end
    end
  end
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
do
  local l_0_2, l_0_3 = l_0_1:match("%.([a-z0-9]+)$") or ""
  -- DECOMPILER ERROR at PC111: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC113: Confused about usage of register: R2 in 'UnsetPending'

  if l_0_2 ~= "exe" and l_0_2 ~= "dll" then
    return mp.CLEAN
  end
  local l_0_4 = nil
  local l_0_5 = IsProcNameInParentProcessTree
  local l_0_6 = "BM"
  l_0_5 = l_0_5(l_0_6, {"gpscript.exe"}, 4)
  if not l_0_5 then
    l_0_5 = mp
    l_0_5 = l_0_5.CLEAN
    return l_0_5
  end
  l_0_5 = mp
  l_0_5 = l_0_5.IsKnownFriendlyFile
  l_0_6 = l_0_0
  l_0_5 = l_0_5(l_0_6, true, false)
  if l_0_5 then
    l_0_5 = mp
    l_0_5 = l_0_5.CLEAN
    return l_0_5
  end
  l_0_5 = nil
  l_0_6 = this_sigattrlog
  l_0_6 = l_0_6[1]
  l_0_6 = l_0_6.matched
  if l_0_6 then
    l_0_6 = isnull
    l_0_6 = l_0_6((this_sigattrlog[1]).utf8p2)
    if not l_0_6 then
      l_0_6 = this_sigattrlog
      l_0_6 = l_0_6[1]
      l_0_5 = l_0_6.utf8p2
    else
      l_0_6 = this_sigattrlog
      l_0_6 = l_0_6[2]
      l_0_6 = l_0_6.matched
      if l_0_6 then
        l_0_6 = isnull
        l_0_6 = l_0_6((this_sigattrlog[2]).utf8p2)
        if not l_0_6 then
          l_0_6 = this_sigattrlog
          l_0_6 = l_0_6[2]
          l_0_5 = l_0_6.utf8p2
        end
      end
    end
    l_0_6 = isnull
    l_0_6 = l_0_6(l_0_5)
    if not l_0_6 then
      l_0_6 = string
      l_0_6 = l_0_6.lower
      l_0_6 = l_0_6(l_0_5)
      if (string.find)(l_0_6, "executionpolicy bypass", 1, true) or (string.find)(l_0_6, "-ep bypass", 1, true) or (string.find)(l_0_6, "executionpolicy unrestricted", 1, true) then
        (bm.add_related_string)("gpo_payload_ps_execpolicy", "bypass", bm.RelatedStringBMReport)
      end
    end
    l_0_6 = sysio
    l_0_6 = l_0_6.IsFileExists
    l_0_6 = l_0_6(l_0_0)
    if l_0_6 then
      l_0_6 = bm
      l_0_6 = l_0_6.add_related_file
      l_0_6(l_0_0)
    end
    l_0_6 = bm
    l_0_6 = l_0_6.add_related_string
    l_0_6("gpo_payload_browser_dir", l_0_1, bm.RelatedStringBMReport)
    l_0_6 = add_parents
    l_0_6()
    l_0_6 = TrackPidAndTechniqueBM
    l_0_6("BM", "T1037.001", "gpo_logon_script_payload_drop", 28800)
    l_0_6 = TrackPidAndTechniqueBM
    l_0_6("BM", "T1105", "gpo_logon_script_payload_drop", 28800)
    l_0_6 = TrackPidAndTechniqueBM
    l_0_6("BM", "T1574.002", "gpo_logon_script_payload_drop", 28800)
    l_0_6 = mp
    l_0_6 = l_0_6.INFECTED
    return l_0_6
  end
end

