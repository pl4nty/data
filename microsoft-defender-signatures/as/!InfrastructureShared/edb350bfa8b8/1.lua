-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\edb350bfa8b8\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 then
  (bm.add_related_string)("DownloadRequest", (this_sigattrlog[3]).utf8p2, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN

