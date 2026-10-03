using System.Security.Cryptography;
using System.Security.Cryptography.Pkcs;
using AppControlManager.SiPolicy;

// Decompile binary CI policies (.cip/.p7b, signed or unsigned) to <path>.xml
foreach (string path in args)
{
    byte[] data = File.ReadAllBytes(path);
    try
    {
        SignedCms cms = new();
        cms.Decode(data);
        data = cms.ContentInfo.Content;
    }
    catch (CryptographicException) { }

    using BinaryReader reader = new(new MemoryStream(data));
    SiPolicy policy = BinaryOpsReverse.ParseSiPolicy(reader, s => s);
    CustomSerialization.CreateXmlFromSiPolicy(policy).Save(path + ".xml");
}
