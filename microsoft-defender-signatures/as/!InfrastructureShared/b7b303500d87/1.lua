-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b7b303500d87\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 and (this_sigattrlog[2]).utf8p2 then
  local l_0_0 = safeJsonDeserialize((this_sigattrlog[2]).utf8p2)
  local l_0_1 = (string.match)(((bm.get_imagepath)()):lower(), "appdata\\local\\(.*)")
  local l_0_2 = ((this_sigattrlog[1]).utf8p1):lower()
  if (string.byte)(l_0_2) == (string.byte)("%") then
    l_0_2 = (string.match)(l_0_2, "%%localappdata%%\\(.*)")
  else
    l_0_2 = (string.match)(l_0_2, "appdata\\local\\(.*)")
  end
  if l_0_1 == l_0_2 and tonumber(l_0_0.append_size) == 334 then
    reportTimingData()
    ;
    (bm.add_related_string)("file_append_meta", (this_sigattrlog[2]).utf8p2, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

