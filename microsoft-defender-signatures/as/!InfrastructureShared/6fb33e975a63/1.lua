-- Threat: !InfrastructureShared
-- Name: 6fb33e975a63
-- Type: 21

if this_sigattrlog[1].matched then
  if this_sigattrlog[1].utf8p1 ~= nil then
    bm.add_related_string("RenameFileSource", this_sigattrlog[1].utf8p1, bm.RelatedStringBMReport)
  end
  if this_sigattrlog[1].utf8p2 ~= nil then
    bm.add_related_file(this_sigattrlog[1].utf8p2)
  end
end
return mp.INFECTED
