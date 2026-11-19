-- Threat: !InfrastructureShared
-- Name: edb350bfa8b8
-- Type: 21

if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  bm.add_related_string("DownloadRequest", this_sigattrlog[3].utf8p2, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
