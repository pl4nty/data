-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\152b3581c6f7a\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched and not (this_sigattrlog[2]).matched and not (this_sigattrlog[3]).matched then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[4]).matched and not isnull((this_sigattrlog[4]).utf8p1) then
  l_0_0 = (this_sigattrlog[4]).utf8p1
else
  if (this_sigattrlog[5]).matched and not isnull((this_sigattrlog[5]).utf8p1) then
    l_0_0 = (this_sigattrlog[5]).utf8p1
  end
end
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
if not (string.find)(l_0_1, "\\sysvol\\", 1, true) or not (string.find)(l_0_1, "\\policies\\", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_1, "\\scripts\\logon\\", 1, true) ~= nil and not (string.find)(l_0_1, "\\scripts\\startup\\", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_10 = nil
if isnull((MpCommon.PathToWin32Path)(l_0_0)) then
  local l_0_11 = nil
  if not ((sysio.GetLastResult)()).Success then
    return mp.CLEAN
  end
  if isnull((sysio.GetFileSize)(l_0_0)) or (sysio.GetFileSize)(l_0_0) <= 0 then
    return mp.CLEAN
  end
  do
    local l_0_12, l_0_13 = nil
    -- DECOMPILER ERROR at PC153: Confused about usage of register: R4 in 'UnsetPending'

    local l_0_14 = nil
    if not ((sysio.GetLastResult)()).Success then
      return mp.CLEAN
    end
    if isnull((sysio.ReadFile)(l_0_12, 0, (sysio.GetFileSize)(l_0_0) > 131072 and 131072 or (sysio.GetFileSize)(l_0_0))) then
      return mp.CLEAN
    end
    local l_0_15 = nil
    local l_0_16 = nil
    local l_0_17 = nil
    local l_0_18 = (string.lower)(tostring((sysio.ReadFile)(l_0_12, 0, (sysio.GetFileSize)(l_0_0) > 131072 and 131072 or (sysio.GetFileSize)(l_0_0))))
    local l_0_19 = nil
    do
      local l_0_20 = 0
      if (function(l_1_0, l_1_1)
  -- function num : 0_0
  for l_1_5,l_1_6 in ipairs(l_1_1) do
    if (string.find)(l_1_0, l_1_6, 1, true) then
      return true
    end
  end
  return false
end
)(l_0_18, {"executionpolicy bypass", "-ep bypass", "-exec bypass", "-executionpolicy unrestricted"}) then
        l_0_20 = l_0_20 + 2
      end
      if l_0_19(l_0_18, {"downloadstring", "downloadfile", "downloaddata", "invoke-webrequest", "iwr ", "invoke-restmethod", "start-bitstransfer", "net.webclient", "system.net.webclient", "curl ", "wget ", "certutil -urlcache"}) then
        l_0_20 = l_0_20 + 2
      end
      if l_0_19(l_0_18, {"\\google\\chrome\\application", "\\microsoft\\edge\\application", "\\bravesoftware\\brave-browser\\application", "\\chromium\\application"}) then
        l_0_20 = l_0_20 + 2
      end
      if l_0_19(l_0_18, {"-encodedcommand", "-enc ", "frombase64string", "::frombase64", "invoke-expression", "iex(", "iex ("}) then
        l_0_20 = l_0_20 + 1
      end
      if l_0_19(l_0_18, {"writeallbytes", "[io.file]::write", "-encoding byte", "set-content -encoding byte"}) then
        l_0_20 = l_0_20 + 1
      end
      if l_0_19(l_0_18, {"add-mppreference", "set-mppreference", "disablerealtimemonitoring"}) then
        l_0_20 = l_0_20 + 2
      end
      if l_0_20 < 3 then
        return mp.CLEAN
      end
      ;
      (bm.add_related_string)("gpo_script_artifact", l_0_0, bm.RelatedStringBMReport)
      ;
      (bm.add_related_string)("gpo_script_location", l_0_10 and "Logon" or "Startup", bm.RelatedStringBMReport)
      if not isnull((bm.get_imagepath)()) then
        (bm.add_related_file)((bm.get_imagepath)())
      end
      add_parents()
      TrackPidAndTechniqueBM("BM", "T1484.001", "gpo_logon_script_staging", 28800)
      TrackPidAndTechniqueBM("BM", "T1037.001", "gpo_logon_script_staging", 28800)
      do return mp.INFECTED end
      -- DECOMPILER ERROR: 21 unprocessed JMP targets
    end
  end
end

