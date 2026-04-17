-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c4b3dfbd761f\1.luac 

-- params : ...
-- function num : 0
local l_0_8 = nil
if (this_sigattrlog[2]).matched then
  do
    if (this_sigattrlog[2]).utf8p1 ~= nil then
      local l_0_0, l_0_2, l_0_4, l_0_5, l_0_6 = nil, false
    end
    do
      if (this_sigattrlog[2]).utf8p2 ~= nil then
        local l_0_1, l_0_3, l_0_7 = (string.lower)((this_sigattrlog[2]).utf8p2)
      end
      if not (this_sigattrlog[3]).matched or (this_sigattrlog[3]).utf8p1 == nil or isnull((string.lower)((this_sigattrlog[3]).utf8p1)) then
        return mp.CLEAN
      end
      do
        if l_0_8 ~= nil then
          local l_0_9 = nil
          if not contains(l_0_8, {"\\users\\", "\\appdata\\", "\\temp\\", "\\desktop\\", "\\downloads\\", "\\documents\\", "\\public\\"}, true) then
            return mp.CLEAN
          end
        end
        local l_0_10 = nil
        if isnull((bm.get_imagepath)()) or isnull(l_0_8) or l_0_8 ~= (string.lower)((bm.get_imagepath)()) or not isnull(l_0_8) then
          (bm.add_related_file)(l_0_8)
        end
        ;
        (bm.add_related_file)(l_0_10)
        if true then
          (bm.add_related_string)("SelfCopyToSys32", l_0_10, bm.RelatedStringBMReport)
        end
        TrackPidAndTechniqueBM("BM", "T1574.001", "CloudPlaceholderLPE")
        return mp.INFECTED
      end
    end
  end
end

