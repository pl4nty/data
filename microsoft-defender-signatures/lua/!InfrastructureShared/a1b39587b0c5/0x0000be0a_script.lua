-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a1b39587b0c5\0x0000be0a_luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
    local l_0_0 = safeJsonDeserialize((this_sigattrlog[3]).utf8p2)
    if tonumber(l_0_0.append_size) >= 1000 and (l_0_0.appended_ext):lower() == ".play" then
      reportTimingData()
      ;
      (bm.add_related_string)("file_append_meta", (this_sigattrlog[3]).utf8p2, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

