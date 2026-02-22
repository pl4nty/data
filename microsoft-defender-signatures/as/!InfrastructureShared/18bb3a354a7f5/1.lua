-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\18bb3a354a7f5\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[7]).matched or (this_sigattrlog[7]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[7]).utf8p2)
local l_0_1 = (bm.get_imagepath)()
if not l_0_1:match("\\([^\\]+)$") then
  local l_0_2 = (string.lower)(isnull(l_0_1) or (string.len)(l_0_1) <= 4 or "")
  do
    local l_0_3 = {}
    l_0_3["services.exe"] = true
    l_0_3["svchost.exe"] = true
    l_0_3["trustedinstaller.exe"] = true
    l_0_3["tiworker.exe"] = true
    l_0_3["poqexec.exe"] = true
    l_0_3["msmpeng.exe"] = true
    l_0_3["msiexec.exe"] = true
    l_0_3["setuphost.exe"] = true
    l_0_3["osrssinst.exe"] = true
    l_0_3["printisolationhost.exe"] = true
    if l_0_3[l_0_2] then
      return mp.CLEAN
    end
    local l_0_4 = (mp.ContextualExpandEnvironmentVariables)(l_0_0)
    if not isnull(l_0_4) then
      l_0_0 = (string.lower)(l_0_4)
    end
    local l_0_5 = ((mp.GetExecutablesFromCommandLine)(l_0_0))
    local l_0_6 = nil
    if not isnull(l_0_5) then
      l_0_6 = l_0_5[1]
    else
      l_0_6 = l_0_0
    end
    local l_0_7 = {}
    -- DECOMPILER ERROR at PC91: No list found for R5 , SetList fails

    -- DECOMPILER ERROR at PC92: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC93: Overwrote pending register: R7 in 'AssignReg'

    for l_0_11,l_0_12 in ("\\spool\\drivers\\")("\\printconfig.dll") do
      if (string.find)(l_0_6, l_0_12, 1, true) then
        return mp.CLEAN
      end
    end
    if (mp.IsKnownFriendlyFile)(l_0_6, true, false) then
      return mp.CLEAN
    end
    local l_0_13 = (this_sigattrlog[7]).utf8p1
    do
      if not isnull(l_0_13) then
        local l_0_14 = (string.match)((string.lower)(l_0_13), "\\services\\([^\\]+)")
        if l_0_14 then
          (bm.add_related_string)("HijackedService", l_0_14, bm.RelatedStringBMReport)
        end
      end
      if (sysio.IsFileExists)(l_0_6) then
        (bm.add_related_file)(l_0_6)
        ;
        (bm.add_threat_file)(l_0_6)
      end
      TrackFileAndTechnique(l_0_6, "T1543.003:svc_dll_hijack", 1000)
      TrackPidAndTechniqueBM("BM", "T1574.001", "susp_svc_dll_hijack")
      return mp.INFECTED
    end
  end
end

