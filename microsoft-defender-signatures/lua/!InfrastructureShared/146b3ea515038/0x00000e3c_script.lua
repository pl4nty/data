-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\146b3ea515038\0x00000e3c_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = nil, nil
if (this_sigattrlog[1]).matched and not isnull((this_sigattrlog[1]).utf8p1) and not isnull((this_sigattrlog[1]).utf8p2) then
  l_0_1 = (string.lower)((this_sigattrlog[1]).utf8p1)
else
  -- DECOMPILER ERROR at PC74: Overwrote pending register: R2 in 'AssignReg'

  if (this_sigattrlog[2]).matched and not isnull((this_sigattrlog[2]).utf8p1) and not isnull((this_sigattrlog[2]).utf8p2) then
    l_0_1 = (string.lower)((this_sigattrlog[2]).utf8p1)
  else
    return mp.CLEAN
  end
end
local l_0_3 = (string.match)(l_0_2, "://([^/]+%.[^/]+)")
if isnull(l_0_3) or (string.find)(l_0_3, "^127%.%d+%.%d+%.%d+$") or (string.find)(l_0_3, "^fe80::") or l_0_3 == "r.office.microsoft.com" then
  return mp.CLEAN
end
local l_0_4 = (string.match)(l_0_1, "outlook\\+(.-)\\+url")
if isnull(l_0_4) then
  return mp.CLEAN
end
TrackPidAndTechniqueBM(l_0_0.ppid, "T1137.004", (string.format)("tamper_%s", (string.gsub)((string.gsub)(l_0_4, "\\", "_"), " ", "")))
return mp.INFECTED

