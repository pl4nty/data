-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\155b312eee5b2\0x0000093a_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil or (this_sigattrlog[2]).utf8p1 == "" or (this_sigattrlog[2]).utf8p2 == nil or (this_sigattrlog[2]).utf8p2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS((this_sigattrlog[2]).utf8p2) or IsExcludedByImagePathMacOS((this_sigattrlog[2]).utf8p1) then
  return mp.CLEAN
end
if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[3]).utf8p1 == "" then
  return mp.CLEAN
end
if (string.find)((this_sigattrlog[3]).utf8p1, " ", -1, true) ~= nil then
  local l_0_0 = (this_sigattrlog[2]).utf8p1
  if (sysio.IsFileExists)(l_0_0) then
    (bm.add_threat_file)(l_0_0)
  end
  local l_0_1 = (this_sigattrlog[3]).utf8p1
  if (sysio.IsFileExists)(l_0_1) then
    (bm.add_threat_file)(l_0_1)
  end
  return mp.INFECTED
end
do
  return mp.CLEAN
end

