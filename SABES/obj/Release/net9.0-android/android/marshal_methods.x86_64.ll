; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [263 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [789 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 209
	i64 u0x0071cf2d27b7d61e, ; 1: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 178
	i64 u0x01109b0e4d99e61f, ; 2: System.ComponentModel.Annotations.dll => 193
	i64 u0x01689251854dc4e9, ; 3: Microsoft.CodeAnalysis.Workspaces => 110
	i64 u0x01db22f5d13bd29b, ; 4: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.dll => 111
	i64 u0x02123411c4e01926, ; 5: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 174
	i64 u0x02a4c5a44384f885, ; 6: Microsoft.Extensions.Caching.Memory => 120
	i64 u0x02abedc11addc1ed, ; 7: lib_Mono.Android.Runtime.dll.so => 261
	i64 u0x032267b2a94db371, ; 8: lib_Xamarin.AndroidX.AppCompat.dll.so => 157
	i64 u0x032344a7b9e98c5d, ; 9: ko/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 32
	i64 u0x033c3301d21c58c1, ; 10: pl/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 59
	i64 u0x0363ac97a4cb84e6, ; 11: SQLitePCLRaw.provider.e_sqlite3.dll => 149
	i64 u0x04263eac65fdd0c7, ; 12: lib-ko-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 58
	i64 u0x043032f1d071fae0, ; 13: ru/Microsoft.Maui.Controls.resources => 89
	i64 u0x044440a55165631e, ; 14: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 67
	i64 u0x046eb1581a80c6b0, ; 15: vi/Microsoft.Maui.Controls.resources => 95
	i64 u0x0517ef04e06e9f76, ; 16: System.Net.Primitives => 222
	i64 u0x0565d18c6da3de38, ; 17: Xamarin.AndroidX.RecyclerView => 176
	i64 u0x057bf9fa9fb09f7c, ; 18: Microsoft.Data.Sqlite.dll => 113
	i64 u0x0581db89237110e9, ; 19: lib_System.Collections.dll.so => 192
	i64 u0x05989cb940b225a9, ; 20: Microsoft.Maui.dll => 138
	i64 u0x05ef98b6a1db882c, ; 21: lib_Microsoft.Data.Sqlite.dll.so => 113
	i64 u0x06076b5d2b581f08, ; 22: zh-HK/Microsoft.Maui.Controls.resources => 96
	i64 u0x06388ffe9f6c161a, ; 23: System.Xml.Linq.dll => 252
	i64 u0x063a29293b0d81df, ; 24: lib-ja-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 57
	i64 u0x0680a433c781bb3d, ; 25: Xamarin.AndroidX.Collection.Jvm => 160
	i64 u0x0690533f9fc14683, ; 26: lib_Microsoft.AspNetCore.Components.dll.so => 101
	i64 u0x069fff96ec92a91d, ; 27: System.Xml.XPath.dll => 256
	i64 u0x06c665f3abc4d365, ; 28: lib_Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.dll.so => 111
	i64 u0x07c57877c7ba78ad, ; 29: ru/Microsoft.Maui.Controls.resources.dll => 89
	i64 u0x07dcdc7460a0c5e4, ; 30: System.Collections.NonGeneric => 190
	i64 u0x0883f5fb92189b50, ; 31: ja/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 31
	i64 u0x08a7c865576bbde7, ; 32: System.Reflection.Primitives => 231
	i64 u0x08f3c9788ee2153c, ; 33: Xamarin.AndroidX.DrawerLayout => 165
	i64 u0x09138715c92dba90, ; 34: lib_System.ComponentModel.Annotations.dll.so => 193
	i64 u0x0919c28b89381a0b, ; 35: lib_Microsoft.Extensions.Options.dll.so => 133
	i64 u0x092266563089ae3e, ; 36: lib_System.Collections.NonGeneric.dll.so => 190
	i64 u0x09ab38ad9baf7214, ; 37: lib-zh-Hant-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 51
	i64 u0x09d144a7e214d457, ; 38: System.Security.Cryptography => 239
	i64 u0x09e2b9f743db21a8, ; 39: lib_System.Reflection.Metadata.dll.so => 230
	i64 u0x0a805f95d98f597b, ; 40: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 119
	i64 u0x0abb3e2b271edc45, ; 41: System.Threading.Channels.dll => 245
	i64 u0x0b3b632c3bbee20c, ; 42: sk/Microsoft.Maui.Controls.resources => 90
	i64 u0x0b6aff547b84fbe9, ; 43: Xamarin.KotlinX.Serialization.Core.Jvm => 185
	i64 u0x0bc0062e3ae6b583, ; 44: Microsoft.Build.Locator => 106
	i64 u0x0be2e1f8ce4064ed, ; 45: Xamarin.AndroidX.ViewPager => 180
	i64 u0x0c279376b1ae96ae, ; 46: lib_System.CodeDom.dll.so => 150
	i64 u0x0c36eea625afafdf, ; 47: ja/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 57
	i64 u0x0c3ca6cc978e2aae, ; 48: pt-BR/Microsoft.Maui.Controls.resources => 86
	i64 u0x0c59ad9fbbd43abe, ; 49: Mono.Android => 262
	i64 u0x0c7790f60165fc06, ; 50: lib_Microsoft.Maui.Essentials.dll.so => 139
	i64 u0x0cf6a95dadccbb9c, ; 51: zh-Hant/Microsoft.CodeAnalysis.resources.dll => 12
	i64 u0x0e7acf675d09f75a, ; 52: it/Microsoft.CodeAnalysis.resources => 4
	i64 u0x0eba9c561385a823, ; 53: fr/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 29
	i64 u0x0ec01b05613190b9, ; 54: SkiaSharp.Views.Android.dll => 143
	i64 u0x0ec47e16319c99d9, ; 55: lib-de-Microsoft.CodeAnalysis.resources.dll.so => 1
	i64 u0x102a31b45304b1da, ; 56: Xamarin.AndroidX.CustomView => 164
	i64 u0x105b053cfbaba1f0, ; 57: lib_Microsoft.CodeAnalysis.dll.so => 107
	i64 u0x10a579e648829775, ; 58: Microsoft.CodeAnalysis => 107
	i64 u0x10f6cfcbcf801616, ; 59: System.IO.Compression.Brotli => 210
	i64 u0x114df3ff11650a65, ; 60: ru/Microsoft.CodeAnalysis.CSharp.resources => 22
	i64 u0x1208da3842d90ff3, ; 61: lib-ko-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 19
	i64 u0x125b7f94acb989db, ; 62: Xamarin.AndroidX.RecyclerView.dll => 176
	i64 u0x131463e9417f52d4, ; 63: de/Microsoft.CodeAnalysis.CSharp.resources => 14
	i64 u0x1342be0dbae61807, ; 64: lib_SABES.dll.so => 186
	i64 u0x1393617ead22674a, ; 65: zh-Hant/Microsoft.CodeAnalysis.resources => 12
	i64 u0x13a01de0cbc3f06c, ; 66: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 73
	i64 u0x13f1e5e209e91af4, ; 67: lib_Java.Interop.dll.so => 260
	i64 u0x13f1e880c25d96d1, ; 68: he/Microsoft.Maui.Controls.resources => 74
	i64 u0x143d8ea60a6a4011, ; 69: Microsoft.Extensions.DependencyInjection.Abstractions => 124
	i64 u0x1446c7a06695f3ea, ; 70: ko/Microsoft.CodeAnalysis.CSharp.resources.dll => 19
	i64 u0x1506378c0000a92a, ; 71: lib-tr-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 23
	i64 u0x155943230c062553, ; 72: lib-zh-Hant-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 64
	i64 u0x16054fdcb6b3098b, ; 73: Microsoft.Extensions.DependencyModel.dll => 125
	i64 u0x16bf2a22df043a09, ; 74: System.IO.Pipes.dll => 215
	i64 u0x17125c9a85b4929f, ; 75: lib_netstandard.dll.so => 258
	i64 u0x17976319373fd889, ; 76: cs/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 26
	i64 u0x17b56e25558a5d36, ; 77: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 77
	i64 u0x17f9358913beb16a, ; 78: System.Text.Encodings.Web => 242
	i64 u0x18032a868e0c3843, ; 79: de/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 53
	i64 u0x18402a709e357f3b, ; 80: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 185
	i64 u0x18950fae1c2bc98e, ; 81: lib-cs-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 13
	i64 u0x18f0ce884e87d89a, ; 82: nb/Microsoft.Maui.Controls.resources.dll => 83
	i64 u0x192712eaa333180f, ; 83: lib-zh-Hant-Microsoft.CodeAnalysis.resources.dll.so => 12
	i64 u0x194dc72e14e1bd09, ; 84: de/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 27
	i64 u0x1a761daba47c6ad5, ; 85: ja/Microsoft.CodeAnalysis.resources.dll => 5
	i64 u0x1a91866a319e9259, ; 86: lib_System.Collections.Concurrent.dll.so => 188
	i64 u0x1a9e139e4762aaf8, ; 87: es/Microsoft.CodeAnalysis.CSharp.resources.dll => 15
	i64 u0x1aac34d1917ba5d3, ; 88: lib_System.dll.so => 257
	i64 u0x1aad60783ffa3e5b, ; 89: lib-th-Microsoft.Maui.Controls.resources.dll.so => 92
	i64 u0x1b50378f54aa4b01, ; 90: pt-BR/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 60
	i64 u0x1b8700ce6e547c0b, ; 91: lib_Microsoft.AspNetCore.Components.Forms.dll.so => 102
	i64 u0x1c074bdeeae2e1c9, ; 92: lib-pl-Microsoft.CodeAnalysis.resources.dll.so => 7
	i64 u0x1c5217a9e4973753, ; 93: lib_Microsoft.Extensions.FileProviders.Physical.dll.so => 129
	i64 u0x1c753b5ff15bce1b, ; 94: Mono.Android.Runtime.dll => 261
	i64 u0x1cce6e800e06bdb7, ; 95: zh-Hans/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 63
	i64 u0x1d68fe2a371ca539, ; 96: zh-Hans/Microsoft.CodeAnalysis.Workspaces.resources.dll => 50
	i64 u0x1dbb0c2c6a999acb, ; 97: System.Diagnostics.StackTrace => 203
	i64 u0x1e3d87657e9659bc, ; 98: Xamarin.AndroidX.Navigation.UI => 175
	i64 u0x1e71143913d56c10, ; 99: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 81
	i64 u0x1e7c31185e2fb266, ; 100: lib_System.Threading.Tasks.Parallel.dll.so => 246
	i64 u0x1ed8fcce5e9b50a0, ; 101: Microsoft.Extensions.Options.dll => 133
	i64 u0x1edf56c90236be4d, ; 102: ru/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 61
	i64 u0x1f1ed22c1085f044, ; 103: lib_System.Diagnostics.FileVersionInfo.dll.so => 201
	i64 u0x1f2c5edaae56f4c2, ; 104: tr/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 36
	i64 u0x1fe22396eed9deb5, ; 105: lib-pl-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 46
	i64 u0x209375905fcc1bad, ; 106: lib_System.IO.Compression.Brotli.dll.so => 210
	i64 u0x20fab3cf2dfbc8df, ; 107: lib_System.Diagnostics.Process.dll.so => 202
	i64 u0x2110167c128cba15, ; 108: System.Globalization => 209
	i64 u0x2174319c0d835bc9, ; 109: System.Runtime => 238
	i64 u0x220fd4f2e7c48170, ; 110: th/Microsoft.Maui.Controls.resources => 92
	i64 u0x224538d85ed15a82, ; 111: System.IO.Pipes => 215
	i64 u0x237be844f1f812c7, ; 112: System.Threading.Thread.dll => 247
	i64 u0x23807c59646ec4f3, ; 113: lib_Microsoft.EntityFrameworkCore.dll.so => 114
	i64 u0x2407aef2bbe8fadf, ; 114: System.Console => 197
	i64 u0x240abe014b27e7d3, ; 115: Xamarin.AndroidX.Core.dll => 162
	i64 u0x245ebc45bf698558, ; 116: ru/Microsoft.CodeAnalysis.resources.dll => 9
	i64 u0x247619fe4413f8bf, ; 117: System.Runtime.Serialization.Primitives.dll => 237
	i64 u0x24a5c479679dfcd0, ; 118: ru/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 61
	i64 u0x24cbd781fb976f7f, ; 119: lib_Microsoft.CodeAnalysis.Workspaces.MSBuild.dll.so => 112
	i64 u0x252073cc3caa62c2, ; 120: fr/Microsoft.Maui.Controls.resources.dll => 73
	i64 u0x25a0a7eff76ea08e, ; 121: SQLitePCLRaw.batteries_v2.dll => 146
	i64 u0x25dbdf9c11e7095a, ; 122: cs/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 52
	i64 u0x2626d536c88621f2, ; 123: lib-ko-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 32
	i64 u0x2662c629b96b0b30, ; 124: lib_Xamarin.Kotlin.StdLib.dll.so => 183
	i64 u0x268c1439f13bcc29, ; 125: lib_Microsoft.Extensions.Primitives.dll.so => 134
	i64 u0x272377f9edc266a2, ; 126: tr/Microsoft.CodeAnalysis.resources => 10
	i64 u0x273f3515de5faf0d, ; 127: id/Microsoft.Maui.Controls.resources.dll => 78
	i64 u0x2742545f9094896d, ; 128: hr/Microsoft.Maui.Controls.resources => 76
	i64 u0x2760ac2972e51bf5, ; 129: lib-cs-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 26
	i64 u0x27b410442fad6cf1, ; 130: Java.Interop.dll => 260
	i64 u0x2801845a2c71fbfb, ; 131: System.Net.Primitives.dll => 222
	i64 u0x2927d345f3daec35, ; 132: SkiaSharp.dll => 142
	i64 u0x29e4f22f4ae1c7db, ; 133: pl/Microsoft.CodeAnalysis.Workspaces.resources => 46
	i64 u0x2a128783efe70ba0, ; 134: uk/Microsoft.Maui.Controls.resources.dll => 94
	i64 u0x2a3b095612184159, ; 135: lib_System.Net.NetworkInformation.dll.so => 221
	i64 u0x2a6507a5ffabdf28, ; 136: System.Diagnostics.TraceSource.dll => 204
	i64 u0x2ad156c8e1354139, ; 137: fi/Microsoft.Maui.Controls.resources => 72
	i64 u0x2af298f63581d886, ; 138: System.Text.RegularExpressions.dll => 244
	i64 u0x2afc1c4f898552ee, ; 139: lib_System.Formats.Asn1.dll.so => 208
	i64 u0x2b148910ed40fbf9, ; 140: zh-Hant/Microsoft.Maui.Controls.resources.dll => 98
	i64 u0x2b2afdca57bcee98, ; 141: Microsoft.Build.Locator.dll => 106
	i64 u0x2b4d4904cebfa4e9, ; 142: Microsoft.Extensions.FileSystemGlobbing => 130
	i64 u0x2bf0406a075bdf30, ; 143: ja/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 57
	i64 u0x2c8bd14bb93a7d82, ; 144: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 85
	i64 u0x2cbd9262ca785540, ; 145: lib_System.Text.Encoding.CodePages.dll.so => 240
	i64 u0x2cd723e9fe623c7c, ; 146: lib_System.Private.Xml.Linq.dll.so => 228
	i64 u0x2ced40c2c73942d4, ; 147: lib-tr-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 62
	i64 u0x2d169d318a968379, ; 148: System.Threading.dll => 249
	i64 u0x2d47774b7d993f59, ; 149: sv/Microsoft.Maui.Controls.resources.dll => 91
	i64 u0x2d6295bc2ab86a27, ; 150: ja/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 31
	i64 u0x2db915caf23548d2, ; 151: System.Text.Json.dll => 243
	i64 u0x2e4d2e03e610a6e9, ; 152: pl/Microsoft.CodeAnalysis.resources => 7
	i64 u0x2e6f1f226821322a, ; 153: el/Microsoft.Maui.Controls.resources.dll => 70
	i64 u0x2e8ff3fae87a8245, ; 154: lib_Microsoft.JSInterop.dll.so => 135
	i64 u0x2f02f94df3200fe5, ; 155: System.Diagnostics.Process => 202
	i64 u0x2f2e98e1c89b1aff, ; 156: System.Xml.ReaderWriter => 253
	i64 u0x2f5911d9ba814e4e, ; 157: System.Diagnostics.Tracing => 205
	i64 u0x2feb4d2fcda05cfd, ; 158: Microsoft.Extensions.Caching.Abstractions.dll => 119
	i64 u0x30824ea6655a7ec9, ; 159: SABES => 186
	i64 u0x309ee9eeec09a71e, ; 160: lib_Xamarin.AndroidX.Fragment.dll.so => 166
	i64 u0x30dbb00aded5b4cb, ; 161: ko/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 58
	i64 u0x310d9651ec86c411, ; 162: Microsoft.Extensions.FileProviders.Embedded => 128
	i64 u0x31195fef5d8fb552, ; 163: _Microsoft.Android.Resource.Designer.dll => 99
	i64 u0x32243413e774362a, ; 164: Xamarin.AndroidX.CardView.dll => 159
	i64 u0x3235427f8d12dae1, ; 165: lib_System.Drawing.Primitives.dll.so => 206
	i64 u0x324622a9fd95b0c8, ; 166: lib-cs-Microsoft.CodeAnalysis.resources.dll.so => 0
	i64 u0x326256f7722d4fe5, ; 167: SkiaSharp.Views.Maui.Controls.dll => 144
	i64 u0x329753a17a517811, ; 168: fr/Microsoft.Maui.Controls.resources => 73
	i64 u0x32aa989ff07a84ff, ; 169: lib_System.Xml.ReaderWriter.dll.so => 253
	i64 u0x32e787fbcf22bfdb, ; 170: fr/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 55
	i64 u0x33642d5508314e46, ; 171: Microsoft.Extensions.FileSystemGlobbing.dll => 130
	i64 u0x33829542f112d59b, ; 172: System.Collections.Immutable => 189
	i64 u0x33a31443733849fe, ; 173: lib-es-Microsoft.Maui.Controls.resources.dll.so => 71
	i64 u0x33e03d7b100711f1, ; 174: zh-Hans/Microsoft.CodeAnalysis.Workspaces.resources => 50
	i64 u0x341abc357fbb4ebf, ; 175: lib_System.Net.Sockets.dll.so => 224
	i64 u0x34bd01fd4be06ee3, ; 176: lib_Microsoft.Extensions.FileProviders.Composite.dll.so => 127
	i64 u0x34d10ee19592dc34, ; 177: de/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 53
	i64 u0x34dfd74fe2afcf37, ; 178: Microsoft.Maui => 138
	i64 u0x34e292762d9615df, ; 179: cs/Microsoft.Maui.Controls.resources.dll => 67
	i64 u0x34ef56e1435b2843, ; 180: pl/Microsoft.CodeAnalysis.CSharp.resources.dll => 20
	i64 u0x3508234247f48404, ; 181: Microsoft.Maui.Controls => 136
	i64 u0x353590da528c9d22, ; 182: System.ComponentModel.Annotations => 193
	i64 u0x3549870798b4cd30, ; 183: lib_Xamarin.AndroidX.ViewPager2.dll.so => 181
	i64 u0x355282fc1c909694, ; 184: Microsoft.Extensions.Configuration => 121
	i64 u0x356653662ca42eb1, ; 185: lib-it-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 43
	i64 u0x35766456ffb7a7b4, ; 186: fr/Microsoft.CodeAnalysis.CSharp.resources.dll => 16
	i64 u0x35bf814e2d496b74, ; 187: lib_Microsoft.CodeAnalysis.Workspaces.dll.so => 110
	i64 u0x36cada77dc79928b, ; 188: System.IO.MemoryMappedFiles => 213
	i64 u0x374ef46b06791af6, ; 189: System.Reflection.Primitives.dll => 231
	i64 u0x380134e03b1e160a, ; 190: System.Collections.Immutable.dll => 189
	i64 u0x38143d85e217351a, ; 191: System.Composition.Hosting => 153
	i64 u0x3837e860635e56ed, ; 192: it/Microsoft.CodeAnalysis.Workspaces.resources => 43
	i64 u0x3843b9508197bc53, ; 193: pt-BR/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 34
	i64 u0x385c17636bb6fe6e, ; 194: Xamarin.AndroidX.CustomView.dll => 164
	i64 u0x393c226616977fdb, ; 195: lib_Xamarin.AndroidX.ViewPager.dll.so => 180
	i64 u0x395e37c3334cf82a, ; 196: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 66
	i64 u0x39c3107c28752af1, ; 197: lib_Microsoft.Extensions.FileProviders.Abstractions.dll.so => 126
	i64 u0x39eb5ad7e3b83323, ; 198: fr/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 29
	i64 u0x3b519320d3a43198, ; 199: lib-ko-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 45
	i64 u0x3b860f9932505633, ; 200: lib_System.Text.Encoding.Extensions.dll.so => 241
	i64 u0x3be6248c2bc7dc8c, ; 201: Microsoft.JSInterop.dll => 135
	i64 u0x3c7c495f58ac5ee9, ; 202: Xamarin.Kotlin.StdLib => 183
	i64 u0x3d2b1913edfc08d7, ; 203: lib_System.Threading.ThreadPool.dll.so => 248
	i64 u0x3d46f0b995082740, ; 204: System.Xml.Linq => 252
	i64 u0x3d9c2a242b040a50, ; 205: lib_Xamarin.AndroidX.Core.dll.so => 162
	i64 u0x3da7781d6333a8fe, ; 206: SQLitePCLRaw.batteries_v2 => 146
	i64 u0x3e7f8912b96e5065, ; 207: Microsoft.AspNetCore.Components.WebView.dll => 104
	i64 u0x3f9488d1edef88fe, ; 208: lib-pt-BR-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 34
	i64 u0x407a10bb4bf95829, ; 209: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 172
	i64 u0x40c6d9cbfdb8b9f7, ; 210: SkiaSharp.Views.Maui.Core.dll => 145
	i64 u0x415c502eb40e7418, ; 211: es/Microsoft.CodeAnalysis.resources.dll => 2
	i64 u0x41cab042be111c34, ; 212: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 158
	i64 u0x423bf51ae7def810, ; 213: System.Xml.XPath => 256
	i64 u0x42a31b86e6ccc3f0, ; 214: System.Diagnostics.Contracts => 199
	i64 u0x43375950ec7c1b6a, ; 215: netstandard.dll => 258
	i64 u0x434c4e1d9284cdae, ; 216: Mono.Android.dll => 262
	i64 u0x43950f84de7cc79a, ; 217: pl/Microsoft.Maui.Controls.resources.dll => 85
	i64 u0x448bd33429269b19, ; 218: Microsoft.CSharp => 187
	i64 u0x4499fa3c8e494654, ; 219: lib_System.Runtime.Serialization.Primitives.dll.so => 237
	i64 u0x4515080865a951a5, ; 220: Xamarin.Kotlin.StdLib.dll => 183
	i64 u0x453c1277f85cf368, ; 221: lib_Microsoft.EntityFrameworkCore.Abstractions.dll.so => 115
	i64 u0x45c40276a42e283e, ; 222: System.Diagnostics.TraceSource => 204
	i64 u0x45fcc9fd66f25095, ; 223: Microsoft.Extensions.DependencyModel => 125
	i64 u0x4645b3d617ebf34b, ; 224: lib-cs-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 52
	i64 u0x46a4213bc97fe5ae, ; 225: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 89
	i64 u0x46ca22193958c24b, ; 226: Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost => 111
	i64 u0x47358bd471172e1d, ; 227: lib_System.Xml.Linq.dll.so => 252
	i64 u0x475461b41cd2bae5, ; 228: lib-zh-Hant-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 25
	i64 u0x47daf4e1afbada10, ; 229: pt/Microsoft.Maui.Controls.resources => 87
	i64 u0x480c0a47dd42dd81, ; 230: lib_System.IO.MemoryMappedFiles.dll.so => 213
	i64 u0x4843e6c1ee585264, ; 231: Microsoft.EntityFrameworkCore.Design.dll => 116
	i64 u0x48d8ed46e9461716, ; 232: es/Microsoft.CodeAnalysis.Workspaces.resources => 41
	i64 u0x49e952f19a4e2022, ; 233: System.ObjectModel => 226
	i64 u0x49f9e6948a8131e4, ; 234: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 179
	i64 u0x4a1afd3bf9c69c98, ; 235: fr/Microsoft.CodeAnalysis.resources => 3
	i64 u0x4a4f1047df83044b, ; 236: lib_System.Composition.AttributedModel.dll.so => 151
	i64 u0x4a5667b2462a664b, ; 237: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 175
	i64 u0x4a59e8951c30f637, ; 238: lib-zh-Hans-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 50
	i64 u0x4b2c56ec7a03ca88, ; 239: lib-ja-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 44
	i64 u0x4b484a0d637947d7, ; 240: lib-zh-Hans-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 24
	i64 u0x4b558744a6e1abe0, ; 241: lib-de-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 14
	i64 u0x4b7b6532ded934b7, ; 242: System.Text.Json => 243
	i64 u0x4bf547f87e5016a8, ; 243: lib_SkiaSharp.Views.Android.dll.so => 143
	i64 u0x4ca014ceac582c86, ; 244: Microsoft.EntityFrameworkCore.Relational.dll => 117
	i64 u0x4cb66d7fdf45d66b, ; 245: ko/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 32
	i64 u0x4cc5f15266470798, ; 246: lib_Xamarin.AndroidX.Loader.dll.so => 171
	i64 u0x4cf6f67dc77aacd2, ; 247: System.Net.NetworkInformation.dll => 221
	i64 u0x4d479f968a05e504, ; 248: System.Linq.Expressions.dll => 216
	i64 u0x4d55a010ffc4faff, ; 249: System.Private.Xml => 229
	i64 u0x4d95fccc1f67c7ca, ; 250: System.Runtime.Loader.dll => 234
	i64 u0x4dcf44c3c9b076a2, ; 251: it/Microsoft.Maui.Controls.resources.dll => 79
	i64 u0x4dd35d8b99c17bef, ; 252: zh-Hans/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 63
	i64 u0x4dd9247f1d2c3235, ; 253: Xamarin.AndroidX.Loader.dll => 171
	i64 u0x4df510084e2a0bae, ; 254: Microsoft.JSInterop => 135
	i64 u0x4e0118d7e6df6ed3, ; 255: lib-zh-Hans-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 37
	i64 u0x4e32f00cb0937401, ; 256: Mono.Android.Runtime => 261
	i64 u0x4e5eea4668ac2b18, ; 257: System.Text.Encoding.CodePages => 240
	i64 u0x4e84220084ab2d20, ; 258: cs/Microsoft.CodeAnalysis.CSharp.resources.dll => 13
	i64 u0x4ebd0c4b82c5eefc, ; 259: lib_System.Threading.Channels.dll.so => 245
	i64 u0x4f21ee6ef9eb527e, ; 260: ca/Microsoft.Maui.Controls.resources => 66
	i64 u0x4f395cbd2708b3c5, ; 261: ru/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 35
	i64 u0x4f7ed4233b906e51, ; 262: cs/Microsoft.CodeAnalysis.Workspaces.resources => 39
	i64 u0x4fd5f3ee53d0a4f0, ; 263: SQLitePCLRaw.lib.e_sqlite3.android => 148
	i64 u0x5037f0be3c28c7a3, ; 264: lib_Microsoft.Maui.Controls.dll.so => 136
	i64 u0x5131bbe80989093f, ; 265: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 169
	i64 u0x516d6f0b21a303de, ; 266: lib_System.Diagnostics.Contracts.dll.so => 199
	i64 u0x51bb8a2afe774e32, ; 267: System.Drawing => 207
	i64 u0x526ce79eb8e90527, ; 268: lib_System.Net.Primitives.dll.so => 222
	i64 u0x52829f00b4467c38, ; 269: lib_System.Data.Common.dll.so => 198
	i64 u0x529ffe06f39ab8db, ; 270: Xamarin.AndroidX.Core => 162
	i64 u0x52ff996554dbf352, ; 271: Microsoft.Maui.Graphics => 140
	i64 u0x533514f6711b299b, ; 272: ko/Microsoft.CodeAnalysis.CSharp.resources => 19
	i64 u0x535f7e40e8fef8af, ; 273: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 90
	i64 u0x53a96d5c86c9e194, ; 274: System.Net.NetworkInformation => 221
	i64 u0x53be1038a61e8d44, ; 275: System.Runtime.InteropServices.RuntimeInformation.dll => 232
	i64 u0x53c3014b9437e684, ; 276: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 96
	i64 u0x54795225dd1587af, ; 277: lib_System.Runtime.dll.so => 238
	i64 u0x54d75f85d6578cff, ; 278: lib-fr-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 16
	i64 u0x556e8b63b660ab8b, ; 279: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 167
	i64 u0x5588627c9a108ec9, ; 280: System.Collections.Specialized => 191
	i64 u0x561449e1215a61e4, ; 281: lib_SkiaSharp.Views.Maui.Core.dll.so => 145
	i64 u0x571c5cfbec5ae8e2, ; 282: System.Private.Uri => 227
	i64 u0x5724fbe6b45b7f07, ; 283: lib-pt-BR-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 21
	i64 u0x5759c386703a58a0, ; 284: fr/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 55
	i64 u0x57623b72b8f4cc3f, ; 285: ko/Microsoft.CodeAnalysis.Workspaces.resources.dll => 45
	i64 u0x578cd35c91d7b347, ; 286: lib_SQLitePCLRaw.core.dll.so => 147
	i64 u0x579a06fed6eec900, ; 287: System.Private.CoreLib.dll => 259
	i64 u0x57c542c14049b66d, ; 288: System.Diagnostics.DiagnosticSource => 200
	i64 u0x582e758eda676c85, ; 289: zh-Hant/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 38
	i64 u0x58601b2dda4a27b9, ; 290: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 80
	i64 u0x58688d9af496b168, ; 291: Microsoft.Extensions.DependencyInjection.dll => 123
	i64 u0x58ef0576630aa114, ; 292: fr/Microsoft.CodeAnalysis.CSharp.resources => 16
	i64 u0x595a356d23e8da9a, ; 293: lib_Microsoft.CSharp.dll.so => 187
	i64 u0x597d58a5c4373cea, ; 294: System.Composition.Runtime.dll => 154
	i64 u0x5a89a886ae30258d, ; 295: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 161
	i64 u0x5a8f6699f4a1caa9, ; 296: lib_System.Threading.dll.so => 249
	i64 u0x5ae9cd33b15841bf, ; 297: System.ComponentModel => 196
	i64 u0x5b5ba1327561f926, ; 298: lib_SkiaSharp.Views.Maui.Controls.dll.so => 144
	i64 u0x5b5f0e240a06a2a2, ; 299: da/Microsoft.Maui.Controls.resources.dll => 68
	i64 u0x5ba42c66b858352a, ; 300: ko/Microsoft.CodeAnalysis.Workspaces.resources => 45
	i64 u0x5bb93c3ef9525c89, ; 301: es/Microsoft.CodeAnalysis.resources => 2
	i64 u0x5be34cb3cc2ff949, ; 302: tr/Microsoft.CodeAnalysis.CSharp.resources => 23
	i64 u0x5c393624b8176517, ; 303: lib_Microsoft.Extensions.Logging.dll.so => 131
	i64 u0x5c53c29f5073b0c9, ; 304: System.Diagnostics.FileVersionInfo => 201
	i64 u0x5c6724284a5e7317, ; 305: lib-tr-Microsoft.CodeAnalysis.resources.dll.so => 10
	i64 u0x5d0233e3983e2c1c, ; 306: zh-Hans/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 37
	i64 u0x5d25ef991dd9a85c, ; 307: Microsoft.AspNetCore.Components.WebView.Maui.dll => 105
	i64 u0x5d418180ddc97149, ; 308: es/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 54
	i64 u0x5d7ec76c1c703055, ; 309: System.Threading.Tasks.Parallel => 246
	i64 u0x5db0cbbd1028510e, ; 310: lib_System.Runtime.InteropServices.dll.so => 233
	i64 u0x5db30905d3e5013b, ; 311: Xamarin.AndroidX.Collection.Jvm.dll => 160
	i64 u0x5e467bc8f09ad026, ; 312: System.Collections.Specialized.dll => 191
	i64 u0x5ea92fdb19ec8c4c, ; 313: System.Text.Encodings.Web.dll => 242
	i64 u0x5eb8046dd40e9ac3, ; 314: System.ComponentModel.Primitives => 194
	i64 u0x5f36ccf5c6a57e24, ; 315: System.Xml.ReaderWriter.dll => 253
	i64 u0x5f4294b9b63cb842, ; 316: System.Data.Common => 198
	i64 u0x5f7399e166075632, ; 317: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 148
	i64 u0x5f9a2d823f664957, ; 318: lib-el-Microsoft.Maui.Controls.resources.dll.so => 70
	i64 u0x5fed9a6eec6702f2, ; 319: ja/Microsoft.CodeAnalysis.Workspaces.resources.dll => 44
	i64 u0x609f4b7b63d802d4, ; 320: lib_Microsoft.Extensions.DependencyInjection.dll.so => 123
	i64 u0x60cd4e33d7e60134, ; 321: Xamarin.KotlinX.Coroutines.Core.Jvm => 184
	i64 u0x60e60a6d24a89414, ; 322: tr/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 62
	i64 u0x60f62d786afcf130, ; 323: System.Memory => 219
	i64 u0x61be8d1299194243, ; 324: Microsoft.Maui.Controls.Xaml => 137
	i64 u0x61d2cba29557038f, ; 325: de/Microsoft.Maui.Controls.resources => 69
	i64 u0x61d88f399afb2f45, ; 326: lib_System.Runtime.Loader.dll.so => 234
	i64 u0x6217a46f11608eff, ; 327: de/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 27
	i64 u0x622eef6f9e59068d, ; 328: System.Private.CoreLib => 259
	i64 u0x627f10a4113d036d, ; 329: lib-zh-Hant-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 38
	i64 u0x62c75de2b221b541, ; 330: lib-tr-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 36
	i64 u0x63f1f6883c1e23c2, ; 331: lib_System.Collections.Immutable.dll.so => 189
	i64 u0x6400f68068c1e9f1, ; 332: Xamarin.Google.Android.Material.dll => 182
	i64 u0x64091e0d72efeda1, ; 333: es/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 54
	i64 u0x659c645a2136aadf, ; 334: pt-BR/Microsoft.CodeAnalysis.Workspaces.resources => 47
	i64 u0x65d8ddec9a3de89e, ; 335: ru/Microsoft.CodeAnalysis.resources => 9
	i64 u0x65ecac39144dd3cc, ; 336: Microsoft.Maui.Controls.dll => 136
	i64 u0x65ece51227bfa724, ; 337: lib_System.Runtime.Numerics.dll.so => 235
	i64 u0x6692e924eade1b29, ; 338: lib_System.Console.dll.so => 197
	i64 u0x66a4e5c6a3fb0bae, ; 339: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 169
	i64 u0x66d13304ce1a3efa, ; 340: Xamarin.AndroidX.CursorAdapter => 163
	i64 u0x67488fd20632118d, ; 341: lib-es-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 41
	i64 u0x674c9df133dacc2d, ; 342: it/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 56
	i64 u0x68558ec653afa616, ; 343: lib-da-Microsoft.Maui.Controls.resources.dll.so => 68
	i64 u0x6872ec7a2e36b1ac, ; 344: System.Drawing.Primitives.dll => 206
	i64 u0x68bcc5f7a8af5422, ; 345: Microsoft.EntityFrameworkCore.Design => 116
	i64 u0x68fbbbe2eb455198, ; 346: System.Formats.Asn1 => 208
	i64 u0x69063fc0ba8e6bdd, ; 347: he/Microsoft.Maui.Controls.resources.dll => 74
	i64 u0x695bc7b274a71abf, ; 348: System.Composition.Runtime => 154
	i64 u0x699dffb2427a2d71, ; 349: SQLitePCLRaw.lib.e_sqlite3.android.dll => 148
	i64 u0x69c43767b6624bb2, ; 350: pl/Microsoft.CodeAnalysis.CSharp.resources => 20
	i64 u0x69e7d3906e179d54, ; 351: lib-it-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 56
	i64 u0x6a2ccdb9f29a3667, ; 352: lib-pt-BR-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 60
	i64 u0x6a4d7577b2317255, ; 353: System.Runtime.InteropServices.dll => 233
	i64 u0x6abfbfb2796f4e84, ; 354: Microsoft.CodeAnalysis.CSharp => 108
	i64 u0x6ace3b74b15ee4a4, ; 355: nb/Microsoft.Maui.Controls.resources => 83
	i64 u0x6b8b00fad19364b6, ; 356: lib-ru-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 48
	i64 u0x6c2a741a82a7c853, ; 357: lib-pt-BR-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 47
	i64 u0x6d12bfaa99c72b1f, ; 358: lib_Microsoft.Maui.Graphics.dll.so => 140
	i64 u0x6d79993361e10ef2, ; 359: Microsoft.Extensions.Primitives => 134
	i64 u0x6d86d56b84c8eb71, ; 360: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 163
	i64 u0x6d9bea6b3e895cf7, ; 361: Microsoft.Extensions.Primitives.dll => 134
	i64 u0x6de85c8851699e79, ; 362: Microsoft.CodeAnalysis.CSharp.Workspaces.dll => 109
	i64 u0x6e25a02c3833319a, ; 363: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 173
	i64 u0x6e2fb2ace98ab808, ; 364: zh-Hant/Microsoft.CodeAnalysis.CSharp.resources => 25
	i64 u0x6fd2265da78b93a4, ; 365: lib_Microsoft.Maui.dll.so => 138
	i64 u0x6fdfc7de82c33008, ; 366: cs/Microsoft.Maui.Controls.resources => 67
	i64 u0x6ffc4967cc47ba57, ; 367: System.IO.FileSystem.Watcher.dll => 212
	i64 u0x7078c940a89ab2ee, ; 368: ja/Microsoft.CodeAnalysis.CSharp.resources => 18
	i64 u0x70e99f48c05cb921, ; 369: tr/Microsoft.Maui.Controls.resources.dll => 93
	i64 u0x70fd3deda22442d2, ; 370: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 83
	i64 u0x719e2fe7144bef40, ; 371: lib-fr-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 42
	i64 u0x71a495ea3761dde8, ; 372: lib-it-Microsoft.Maui.Controls.resources.dll.so => 79
	i64 u0x71ad672adbe48f35, ; 373: System.ComponentModel.Primitives.dll => 194
	i64 u0x72b1fb4109e08d7b, ; 374: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 76
	i64 u0x72e0300099accce1, ; 375: System.Xml.XPath.XDocument => 255
	i64 u0x73e4ce94e2eb6ffc, ; 376: lib_System.Memory.dll.so => 219
	i64 u0x73f2645914262879, ; 377: lib_Microsoft.EntityFrameworkCore.Sqlite.dll.so => 118
	i64 u0x755a91767330b3d4, ; 378: lib_Microsoft.Extensions.Configuration.dll.so => 121
	i64 u0x76012e7334db86e5, ; 379: lib_Xamarin.AndroidX.SavedState.dll.so => 177
	i64 u0x769410fc0a876efc, ; 380: tr/Microsoft.CodeAnalysis.Workspaces.resources => 49
	i64 u0x76ca07b878f44da0, ; 381: System.Runtime.Numerics.dll => 235
	i64 u0x780bc73597a503a9, ; 382: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 82
	i64 u0x783606d1e53e7a1a, ; 383: th/Microsoft.Maui.Controls.resources.dll => 92
	i64 u0x7888c8518f32343b, ; 384: tr/Microsoft.CodeAnalysis.resources.dll => 10
	i64 u0x78a45e51311409b6, ; 385: Xamarin.AndroidX.Fragment.dll => 166
	i64 u0x790427a555142820, ; 386: pl/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 59
	i64 u0x7996e32deaf72986, ; 387: Microsoft.CodeAnalysis.CSharp.dll => 108
	i64 u0x7a27813eff68934c, ; 388: it/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 56
	i64 u0x7a71889545dcdb00, ; 389: lib_Microsoft.AspNetCore.Components.WebView.dll.so => 104
	i64 u0x7adb8da2ac89b647, ; 390: fi/Microsoft.Maui.Controls.resources.dll => 72
	i64 u0x7b150145c0a9058c, ; 391: Microsoft.Data.Sqlite => 113
	i64 u0x7bef86a4335c4870, ; 392: System.ComponentModel.TypeConverter => 195
	i64 u0x7c0820144cd34d6a, ; 393: sk/Microsoft.Maui.Controls.resources.dll => 90
	i64 u0x7c2a0bd1e0f988fc, ; 394: lib-de-Microsoft.Maui.Controls.resources.dll.so => 69
	i64 u0x7cb684ea4e7f9d67, ; 395: ja/Microsoft.CodeAnalysis.Workspaces.resources => 44
	i64 u0x7d649b75d580bb42, ; 396: ms/Microsoft.Maui.Controls.resources.dll => 82
	i64 u0x7d8b5821548f89e7, ; 397: Microsoft.AspNetCore.Components.Forms => 102
	i64 u0x7d8ee2bdc8e3aad1, ; 398: System.Numerics.Vectors => 225
	i64 u0x7df7a66da1b3f2a4, ; 399: tr/Microsoft.CodeAnalysis.Workspaces.resources.dll => 49
	i64 u0x7dfc3d6d9d8d7b70, ; 400: System.Collections => 192
	i64 u0x7e2e564fa2f76c65, ; 401: lib_System.Diagnostics.Tracing.dll.so => 205
	i64 u0x7e8491dff6498f33, ; 402: zh-Hans/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 37
	i64 u0x7e946809d6008ef2, ; 403: lib_System.ObjectModel.dll.so => 226
	i64 u0x7ea0077fd2273d61, ; 404: Humanizer.dll => 100
	i64 u0x7ecc13347c8fd849, ; 405: lib_System.ComponentModel.dll.so => 196
	i64 u0x7f00ddd9b9ca5a13, ; 406: Xamarin.AndroidX.ViewPager.dll => 180
	i64 u0x7f9351cd44b1273f, ; 407: Microsoft.Extensions.Configuration.Abstractions => 122
	i64 u0x7fbd557c99b3ce6f, ; 408: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 168
	i64 u0x8099c2f51a031e9e, ; 409: lib-de-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 40
	i64 u0x80da183a87731838, ; 410: System.Reflection.Metadata => 230
	i64 u0x80ee53ea610b3f78, ; 411: zh-Hans/Microsoft.CodeAnalysis.CSharp.resources => 24
	i64 u0x80fa55b6d1b0be99, ; 412: SQLitePCLRaw.provider.e_sqlite3 => 149
	i64 u0x8101a73bd4533440, ; 413: Microsoft.AspNetCore.Components.Web => 103
	i64 u0x812c069d5cdecc17, ; 414: System.dll => 257
	i64 u0x81ab745f6c0f5ce6, ; 415: zh-Hant/Microsoft.Maui.Controls.resources => 98
	i64 u0x82772feb100c9738, ; 416: it/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 30
	i64 u0x8277f2be6b5ce05f, ; 417: Xamarin.AndroidX.AppCompat => 157
	i64 u0x828f06563b30bc50, ; 418: lib_Xamarin.AndroidX.CardView.dll.so => 159
	i64 u0x82df8f5532a10c59, ; 419: lib_System.Drawing.dll.so => 207
	i64 u0x82f6403342e12049, ; 420: uk/Microsoft.Maui.Controls.resources => 94
	i64 u0x83a12f54cac1ef63, ; 421: lib-pl-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 59
	i64 u0x83c14ba66c8e2b8c, ; 422: zh-Hans/Microsoft.Maui.Controls.resources => 97
	i64 u0x83de69860da6cbdd, ; 423: Microsoft.Extensions.FileProviders.Composite => 127
	i64 u0x846ce984efea52c7, ; 424: System.Threading.Tasks.Parallel.dll => 246
	i64 u0x84ae73148a4557d2, ; 425: lib_System.IO.Pipes.dll.so => 215
	i64 u0x84cd5cdec0f54bcc, ; 426: lib_Microsoft.EntityFrameworkCore.Relational.dll.so => 117
	i64 u0x84f9060cc4a93c8f, ; 427: lib_SkiaSharp.dll.so => 142
	i64 u0x855713009ceaac4f, ; 428: System.Composition.TypedParts => 155
	i64 u0x86a909228dc7657b, ; 429: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 98
	i64 u0x86b3e00c36b84509, ; 430: Microsoft.Extensions.Configuration.dll => 121
	i64 u0x8704193f462e892e, ; 431: lib_Microsoft.Extensions.FileSystemGlobbing.dll.so => 130
	i64 u0x87c4b8a492b176ad, ; 432: Microsoft.EntityFrameworkCore.Abstractions => 115
	i64 u0x87c69b87d9283884, ; 433: lib_System.Threading.Thread.dll.so => 247
	i64 u0x87f6569b25707834, ; 434: System.IO.Compression.Brotli.dll => 210
	i64 u0x8842b3a5d2d3fb36, ; 435: Microsoft.Maui.Essentials => 139
	i64 u0x88826e51a5d4a3d0, ; 436: de/Microsoft.CodeAnalysis.resources.dll => 1
	i64 u0x88bda98e0cffb7a9, ; 437: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 184
	i64 u0x8930322c7bd8f768, ; 438: netstandard => 258
	i64 u0x897a606c9e39c75f, ; 439: lib_System.ComponentModel.Primitives.dll.so => 194
	i64 u0x89c5188089ec2cd5, ; 440: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 232
	i64 u0x8a399a706fcbce4b, ; 441: Microsoft.Extensions.Caching.Abstractions => 119
	i64 u0x8a57a9356f6abd4a, ; 442: lib-es-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 28
	i64 u0x8ad229ea26432ee2, ; 443: Xamarin.AndroidX.Loader => 171
	i64 u0x8b4ff5d0fdd5faa1, ; 444: lib_System.Diagnostics.DiagnosticSource.dll.so => 200
	i64 u0x8b523f8a283733d8, ; 445: ru/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 35
	i64 u0x8b8d01333a96d0b5, ; 446: System.Diagnostics.Process.dll => 202
	i64 u0x8b9ceca7acae3451, ; 447: lib-he-Microsoft.Maui.Controls.resources.dll.so => 74
	i64 u0x8c39b02ed181787b, ; 448: pt-BR/Microsoft.CodeAnalysis.CSharp.resources => 21
	i64 u0x8c575135aa1ccef4, ; 449: Microsoft.Extensions.FileProviders.Abstractions => 126
	i64 u0x8d0f420977c2c1c7, ; 450: Xamarin.AndroidX.CursorAdapter.dll => 163
	i64 u0x8d52a25632e81824, ; 451: Microsoft.EntityFrameworkCore.Sqlite.dll => 118
	i64 u0x8d7b8ab4b3310ead, ; 452: System.Threading => 249
	i64 u0x8da188285aadfe8e, ; 453: System.Collections.Concurrent => 188
	i64 u0x8ed5e23fbc329c35, ; 454: cs/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 26
	i64 u0x8ed807bfe9858dfc, ; 455: Xamarin.AndroidX.Navigation.Common => 172
	i64 u0x8ee08b8194a30f48, ; 456: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 75
	i64 u0x8ef7601039857a44, ; 457: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 88
	i64 u0x8ef9414937d93a0a, ; 458: SQLitePCLRaw.core.dll => 147
	i64 u0x8f32c6f611f6ffab, ; 459: pt/Microsoft.Maui.Controls.resources.dll => 87
	i64 u0x8f8829d21c8985a4, ; 460: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 86
	i64 u0x8f8b0f07edd7b3b6, ; 461: cs/Microsoft.CodeAnalysis.resources.dll => 0
	i64 u0x8fa404e6277d0694, ; 462: zh-Hans/Microsoft.CodeAnalysis.CSharp.resources.dll => 24
	i64 u0x8fbf5b0114c6dcef, ; 463: System.Globalization.dll => 209
	i64 u0x8fd27d934d7b3a55, ; 464: SQLitePCLRaw.core => 147
	i64 u0x90263f8448b8f572, ; 465: lib_System.Diagnostics.TraceSource.dll.so => 204
	i64 u0x903101b46fb73a04, ; 466: _Microsoft.Android.Resource.Designer => 99
	i64 u0x90393bd4865292f3, ; 467: lib_System.IO.Compression.dll.so => 211
	i64 u0x90634f86c5ebe2b5, ; 468: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 169
	i64 u0x907b636704ad79ef, ; 469: lib_Microsoft.Maui.Controls.Xaml.dll.so => 137
	i64 u0x90f95fc914407a17, ; 470: lib-pl-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 20
	i64 u0x91418dc638b29e68, ; 471: lib_Xamarin.AndroidX.CustomView.dll.so => 164
	i64 u0x9157bd523cd7ed36, ; 472: lib_System.Text.Json.dll.so => 243
	i64 u0x91871232ff25d47b, ; 473: cs/Microsoft.CodeAnalysis.Workspaces.resources.dll => 39
	i64 u0x91a74f07b30d37e2, ; 474: System.Linq.dll => 218
	i64 u0x91fa41a87223399f, ; 475: ca/Microsoft.Maui.Controls.resources.dll => 66
	i64 u0x92263da4b094eef5, ; 476: lib-cs-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 39
	i64 u0x926c3cf189fe2e18, ; 477: zh-Hans/Microsoft.CodeAnalysis.resources.dll => 11
	i64 u0x928614058c40c4cd, ; 478: lib_System.Xml.XPath.XDocument.dll.so => 255
	i64 u0x9315bb05aa1a03d5, ; 479: de/Microsoft.CodeAnalysis.Workspaces.resources.dll => 40
	i64 u0x93ba953181e66fd2, ; 480: lib-ru-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 22
	i64 u0x93cfa73ab28d6e35, ; 481: ms/Microsoft.Maui.Controls.resources => 82
	i64 u0x944077d8ca3c6580, ; 482: System.IO.Compression.dll => 211
	i64 u0x967fc325e09bfa8c, ; 483: es/Microsoft.Maui.Controls.resources => 71
	i64 u0x96ae8122ac67b30e, ; 484: zh-Hant/Microsoft.CodeAnalysis.Workspaces.resources.dll => 51
	i64 u0x96f01cc18829cc2a, ; 485: System.Composition.Hosting.dll => 153
	i64 u0x9732d8dbddea3d9a, ; 486: id/Microsoft.Maui.Controls.resources => 78
	i64 u0x978be80e5210d31b, ; 487: Microsoft.Maui.Graphics.dll => 140
	i64 u0x97b8c771ea3e4220, ; 488: System.ComponentModel.dll => 196
	i64 u0x97e144c9d3c6976e, ; 489: System.Collections.Concurrent.dll => 188
	i64 u0x98270c46908e26f7, ; 490: zh-Hant/Microsoft.CodeAnalysis.CSharp.resources.dll => 25
	i64 u0x991d510397f92d9d, ; 491: System.Linq.Expressions => 216
	i64 u0x99a00ca5270c6878, ; 492: Xamarin.AndroidX.Navigation.Runtime => 174
	i64 u0x99a891b860c3d03b, ; 493: lib-ko-Microsoft.CodeAnalysis.resources.dll.so => 6
	i64 u0x99cdc6d1f2d3a72f, ; 494: ko/Microsoft.Maui.Controls.resources.dll => 81
	i64 u0x9a102e560c6efe86, ; 495: lib-pt-BR-Microsoft.CodeAnalysis.resources.dll.so => 8
	i64 u0x9a1d5006e4ce0b3a, ; 496: pl/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 33
	i64 u0x9b211a749105beac, ; 497: System.Transactions.Local => 250
	i64 u0x9b5185e0237443f4, ; 498: tr/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 62
	i64 u0x9ba8c32873c681c1, ; 499: it/Microsoft.CodeAnalysis.CSharp.resources.dll => 17
	i64 u0x9be4124ffc84e7ee, ; 500: pl/Microsoft.CodeAnalysis.resources.dll => 7
	i64 u0x9bfc637cbff3a4ec, ; 501: lib-ru-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 35
	i64 u0x9c69fdfa9a154b28, ; 502: tr/Microsoft.CodeAnalysis.CSharp.resources.dll => 23
	i64 u0x9c8f6872beab6408, ; 503: System.Xml.XPath.XDocument.dll => 255
	i64 u0x9d5dbcf5a48583fe, ; 504: lib_Xamarin.AndroidX.Activity.dll.so => 156
	i64 u0x9d74dee1a7725f34, ; 505: Microsoft.Extensions.Configuration.Abstractions.dll => 122
	i64 u0x9dcb570d9792d506, ; 506: lib-ru-Microsoft.CodeAnalysis.resources.dll.so => 9
	i64 u0x9e4534b6adaf6e84, ; 507: nl/Microsoft.Maui.Controls.resources => 84
	i64 u0x9e5a208afd9d15a6, ; 508: it/Microsoft.CodeAnalysis.CSharp.resources => 17
	i64 u0x9eaf1efdf6f7267e, ; 509: Xamarin.AndroidX.Navigation.Common.dll => 172
	i64 u0x9ef542cf1f78c506, ; 510: Xamarin.AndroidX.Lifecycle.LiveData.Core => 168
	i64 u0x9f308fed54f8a5e4, ; 511: tr/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 36
	i64 u0x9fbb2961ca18e5c2, ; 512: Microsoft.Extensions.FileProviders.Physical.dll => 129
	i64 u0x9ff78e804996ce83, ; 513: lib-ja-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 31
	i64 u0xa0d8259f4cc284ec, ; 514: lib_System.Security.Cryptography.dll.so => 239
	i64 u0xa1440773ee9d341e, ; 515: Xamarin.Google.Android.Material => 182
	i64 u0xa1b9d7c27f47219f, ; 516: Xamarin.AndroidX.Navigation.UI.dll => 175
	i64 u0xa2572680829d2c7c, ; 517: System.IO.Pipelines.dll => 214
	i64 u0xa2beee74530fc01c, ; 518: SkiaSharp.Views.Android => 143
	i64 u0xa3b8104115a36bf6, ; 519: lib_Microsoft.Extensions.FileProviders.Embedded.dll.so => 128
	i64 u0xa3d089b150e18d27, ; 520: pt-BR/Microsoft.CodeAnalysis.resources.dll => 8
	i64 u0xa46aa1eaa214539b, ; 521: ko/Microsoft.Maui.Controls.resources => 81
	i64 u0xa4e62983cf1e3674, ; 522: Microsoft.AspNetCore.Components.Forms.dll => 102
	i64 u0xa4edc8f2ceae241a, ; 523: System.Data.Common.dll => 198
	i64 u0xa5494f40f128ce6a, ; 524: System.Runtime.Serialization.Formatters.dll => 236
	i64 u0xa5b7152421ed6d98, ; 525: lib_System.IO.FileSystem.Watcher.dll.so => 212
	i64 u0xa5e599d1e0524750, ; 526: System.Numerics.Vectors.dll => 225
	i64 u0xa5f1ba49b85dd355, ; 527: System.Security.Cryptography.dll => 239
	i64 u0xa67dbee13e1df9ca, ; 528: Xamarin.AndroidX.SavedState.dll => 177
	i64 u0xa68a420042bb9b1f, ; 529: Xamarin.AndroidX.DrawerLayout.dll => 165
	i64 u0xa78ce3745383236a, ; 530: Xamarin.AndroidX.Lifecycle.Common.Jvm => 167
	i64 u0xa7c31b56b4dc7b33, ; 531: hu/Microsoft.Maui.Controls.resources => 77
	i64 u0xa82fd211eef00a5b, ; 532: Microsoft.Extensions.FileProviders.Physical => 129
	i64 u0xa8adea9b1f260c23, ; 533: lib-it-Microsoft.CodeAnalysis.resources.dll.so => 4
	i64 u0xa90e610780116128, ; 534: lib-de-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 53
	i64 u0xaa2219c8e3449ff5, ; 535: Microsoft.Extensions.Logging.Abstractions => 132
	i64 u0xaa443ac34067eeef, ; 536: System.Private.Xml.dll => 229
	i64 u0xaa52de307ef5d1dd, ; 537: System.Net.Http => 220
	i64 u0xaa6579a240a3dc11, ; 538: zh-Hant/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 38
	i64 u0xaa9a7b0214a5cc5c, ; 539: System.Diagnostics.StackTrace.dll => 203
	i64 u0xaaaf86367285a918, ; 540: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 124
	i64 u0xaae72bd80754669a, ; 541: lib-es-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 15
	i64 u0xaaf84bb3f052a265, ; 542: el/Microsoft.Maui.Controls.resources => 70
	i64 u0xab96f4979e4d3631, ; 543: Microsoft.CodeAnalysis.Workspaces.dll => 110
	i64 u0xab9c1b2687d86b0b, ; 544: lib_System.Linq.Expressions.dll.so => 216
	i64 u0xac2af3fa195a15ce, ; 545: System.Runtime.Numerics => 235
	i64 u0xac5376a2a538dc10, ; 546: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 168
	i64 u0xac98d31068e24591, ; 547: System.Xml.XDocument => 254
	i64 u0xacd46e002c3ccb97, ; 548: ro/Microsoft.Maui.Controls.resources => 88
	i64 u0xacf42eea7ef9cd12, ; 549: System.Threading.Channels => 245
	i64 u0xad7b995624a63282, ; 550: pt-BR/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 60
	i64 u0xad89c07347f1bad6, ; 551: nl/Microsoft.Maui.Controls.resources.dll => 84
	i64 u0xadbb53caf78a79d2, ; 552: System.Web.HttpUtility => 251
	i64 u0xadc90ab061a9e6e4, ; 553: System.ComponentModel.TypeConverter.dll => 195
	i64 u0xae282bcd03739de7, ; 554: Java.Interop => 260
	i64 u0xae53579c90db1107, ; 555: System.ObjectModel.dll => 226
	i64 u0xaeafff290ccb288d, ; 556: cs/Microsoft.CodeAnalysis.CSharp.resources => 13
	i64 u0xaf12fb8133ac3fbb, ; 557: Microsoft.EntityFrameworkCore.Sqlite => 118
	i64 u0xafe29f45095518e7, ; 558: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 170
	i64 u0xb05cc42cd94c6d9d, ; 559: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 91
	i64 u0xb0610c1907eee0ba, ; 560: SABES.dll => 186
	i64 u0xb0bb43dc52ea59f9, ; 561: System.Diagnostics.Tracing.dll => 205
	i64 u0xb0c6678edfb08a6d, ; 562: lib-es-Microsoft.CodeAnalysis.resources.dll.so => 2
	i64 u0xb1ccbf6243328d1c, ; 563: Microsoft.AspNetCore.Components => 101
	i64 u0xb220631954820169, ; 564: System.Text.RegularExpressions => 244
	i64 u0xb2a3f67f3bf29fce, ; 565: da/Microsoft.Maui.Controls.resources => 68
	i64 u0xb2aeb4459ab4812d, ; 566: es/Microsoft.CodeAnalysis.CSharp.Workspaces.resources => 28
	i64 u0xb31c53e32a474847, ; 567: zh-Hant/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 64
	i64 u0xb3d5b1cf730ea936, ; 568: pt-BR/Microsoft.CodeAnalysis.resources => 8
	i64 u0xb3f0a0fcda8d3ebc, ; 569: Xamarin.AndroidX.CardView => 159
	i64 u0xb440dc2982bd1f9e, ; 570: lib_Microsoft.CodeAnalysis.CSharp.Workspaces.dll.so => 109
	i64 u0xb46be1aa6d4fff93, ; 571: hi/Microsoft.Maui.Controls.resources => 75
	i64 u0xb477491be13109d8, ; 572: ar/Microsoft.Maui.Controls.resources => 65
	i64 u0xb4b3092fd37a579a, ; 573: ja/Microsoft.CodeAnalysis.CSharp.resources.dll => 18
	i64 u0xb4bd7015ecee9d86, ; 574: System.IO.Pipelines => 214
	i64 u0xb4ff710863453fda, ; 575: System.Diagnostics.FileVersionInfo.dll => 201
	i64 u0xb5c7fcdafbc67ee4, ; 576: Microsoft.Extensions.Logging.Abstractions.dll => 132
	i64 u0xb5ea31d5244c6626, ; 577: System.Threading.ThreadPool.dll => 248
	i64 u0xb69c4329ac29e7f4, ; 578: cs/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 52
	i64 u0xb6daa312e893d3c4, ; 579: lib-ja-Microsoft.CodeAnalysis.resources.dll.so => 5
	i64 u0xb7212c4683a94afe, ; 580: System.Drawing.Primitives => 206
	i64 u0xb7b7753d1f319409, ; 581: sv/Microsoft.Maui.Controls.resources => 91
	i64 u0xb7e73ccf867721d2, ; 582: Mono.TextTemplating => 141
	i64 u0xb7fec5c242fbc590, ; 583: lib-fr-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 55
	i64 u0xb81a2c6e0aee50fe, ; 584: lib_System.Private.CoreLib.dll.so => 259
	i64 u0xb8e68d20aad91196, ; 585: lib_System.Xml.XPath.dll.so => 256
	i64 u0xb9185c33a1643eed, ; 586: Microsoft.CSharp.dll => 187
	i64 u0xb9f64d3b230def68, ; 587: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 87
	i64 u0xb9fc3c8a556e3691, ; 588: ja/Microsoft.Maui.Controls.resources => 80
	i64 u0xba4670aa94a2b3c6, ; 589: lib_System.Xml.XDocument.dll.so => 254
	i64 u0xba48785529705af9, ; 590: System.Collections.dll => 192
	i64 u0xbaf762c4825c14e9, ; 591: Microsoft.AspNetCore.Components.WebView => 104
	i64 u0xbb65706fde942ce3, ; 592: System.Net.Sockets => 224
	i64 u0xbb822a624c99bd72, ; 593: lib-zh-Hans-Microsoft.CodeAnalysis.resources.dll.so => 11
	i64 u0xbbd180354b67271a, ; 594: System.Runtime.Serialization.Formatters => 236
	i64 u0xbc0ad520c3be6d31, ; 595: ja/Microsoft.CodeAnalysis.resources => 5
	i64 u0xbc22a245dab70cb4, ; 596: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 149
	i64 u0xbd0e2c0d55246576, ; 597: System.Net.Http.dll => 220
	i64 u0xbd437a2cdb333d0d, ; 598: Xamarin.AndroidX.ViewPager2 => 181
	i64 u0xbee38d4a88835966, ; 599: Xamarin.AndroidX.AppCompat.AppCompatResources => 158
	i64 u0xbefded20264dcc84, ; 600: lib_Humanizer.dll.so => 100
	i64 u0xbfd57e7eba42c6c7, ; 601: de/Microsoft.CodeAnalysis.CSharp.resources.dll => 14
	i64 u0xc040a4ab55817f58, ; 602: ar/Microsoft.Maui.Controls.resources.dll => 65
	i64 u0xc0b1800a2e6bb02c, ; 603: System.Composition.AttributedModel.dll => 151
	i64 u0xc0ca6b075aeebeec, ; 604: Mono.TextTemplating.dll => 141
	i64 u0xc0d928351ab5ca77, ; 605: System.Console.dll => 197
	i64 u0xc12b8b3afa48329c, ; 606: lib_System.Linq.dll.so => 218
	i64 u0xc1afcc0a4309f4e3, ; 607: ko/Microsoft.CodeAnalysis.resources.dll => 6
	i64 u0xc1c2cb7af77b8858, ; 608: Microsoft.EntityFrameworkCore => 114
	i64 u0xc1ff9ae3cdb6e1e6, ; 609: Xamarin.AndroidX.Activity.dll => 156
	i64 u0xc28c50f32f81cc73, ; 610: ja/Microsoft.Maui.Controls.resources.dll => 80
	i64 u0xc2a3bca55b573141, ; 611: System.IO.FileSystem.Watcher => 212
	i64 u0xc2bcfec99f69365e, ; 612: Xamarin.AndroidX.ViewPager2.dll => 181
	i64 u0xc312870f3556d820, ; 613: Microsoft.CodeAnalysis.Workspaces.MSBuild => 112
	i64 u0xc3492f8f90f96ce4, ; 614: lib_Microsoft.Extensions.DependencyModel.dll.so => 125
	i64 u0xc371a7f62e38d035, ; 615: lib_Microsoft.Build.Locator.dll.so => 106
	i64 u0xc3e74964279d65e6, ; 616: zh-Hans/Microsoft.CodeAnalysis.resources => 11
	i64 u0xc417a7250be7393e, ; 617: System.Composition.TypedParts.dll => 155
	i64 u0xc472ce300460ccb6, ; 618: Microsoft.EntityFrameworkCore.dll => 114
	i64 u0xc4d3858ed4d08512, ; 619: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 170
	i64 u0xc4d69851fe06342f, ; 620: lib_Microsoft.Extensions.Caching.Memory.dll.so => 120
	i64 u0xc50fded0ded1418c, ; 621: lib_System.ComponentModel.TypeConverter.dll.so => 195
	i64 u0xc519125d6bc8fb11, ; 622: lib_System.Net.Requests.dll.so => 223
	i64 u0xc5293b19e4dc230e, ; 623: Xamarin.AndroidX.Navigation.Fragment => 173
	i64 u0xc5325b2fcb37446f, ; 624: lib_System.Private.Xml.dll.so => 229
	i64 u0xc5348fd88280ebea, ; 625: lib-pl-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 33
	i64 u0xc5a0f4b95a699af7, ; 626: lib_System.Private.Uri.dll.so => 227
	i64 u0xc5ebd1ae70875a55, ; 627: lib-tr-Microsoft.CodeAnalysis.Workspaces.resources.dll.so => 49
	i64 u0xc6c5b839055b9d6e, ; 628: lib_Mono.TextTemplating.dll.so => 141
	i64 u0xc6fbcf4db7ee4235, ; 629: lib-de-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 27
	i64 u0xc7c01e7d7c93a110, ; 630: System.Text.Encoding.Extensions.dll => 241
	i64 u0xc7ce851898a4548e, ; 631: lib_System.Web.HttpUtility.dll.so => 251
	i64 u0xc858a28d9ee5a6c5, ; 632: lib_System.Collections.Specialized.dll.so => 191
	i64 u0xca3110fea81c8916, ; 633: Microsoft.AspNetCore.Components.Web.dll => 103
	i64 u0xca32340d8d54dcd5, ; 634: Microsoft.Extensions.Caching.Memory.dll => 120
	i64 u0xca3a723e7342c5b6, ; 635: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 93
	i64 u0xcab3493c70141c2d, ; 636: pl/Microsoft.Maui.Controls.resources => 85
	i64 u0xcacfddc9f7c6de76, ; 637: ro/Microsoft.Maui.Controls.resources.dll => 88
	i64 u0xcb45618372c47127, ; 638: Microsoft.EntityFrameworkCore.Relational => 117
	i64 u0xcbd4fdd9cef4a294, ; 639: lib__Microsoft.Android.Resource.Designer.dll.so => 99
	i64 u0xcc2876b32ef2794c, ; 640: lib_System.Text.RegularExpressions.dll.so => 244
	i64 u0xcc5c3bb714c4561e, ; 641: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 184
	i64 u0xcc76886e09b88260, ; 642: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 185
	i64 u0xcc9fa2923aa1c9ef, ; 643: System.Diagnostics.Contracts.dll => 199
	i64 u0xcce367a95a834654, ; 644: fr/Microsoft.CodeAnalysis.Workspaces.resources.dll => 42
	i64 u0xccf25c4b634ccd3a, ; 645: zh-Hans/Microsoft.Maui.Controls.resources.dll => 97
	i64 u0xcd10a42808629144, ; 646: System.Net.Requests => 223
	i64 u0xcdd0c48b6937b21c, ; 647: Xamarin.AndroidX.SwipeRefreshLayout => 178
	i64 u0xcdf9c0d4c5deebf2, ; 648: zh-Hant/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll => 64
	i64 u0xcf23d8093f3ceadf, ; 649: System.Diagnostics.DiagnosticSource.dll => 200
	i64 u0xcf8fc898f98b0d34, ; 650: System.Private.Xml.Linq => 228
	i64 u0xd02da9e093d0b008, ; 651: Microsoft.CodeAnalysis.Workspaces.MSBuild.dll => 112
	i64 u0xd04b5f59ed596e31, ; 652: System.Reflection.Metadata.dll => 230
	i64 u0xd118cf03aa687fdf, ; 653: cs/Microsoft.CodeAnalysis.resources => 0
	i64 u0xd1194e1d8a8de83c, ; 654: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 167
	i64 u0xd21c7a270cad6fda, ; 655: lib_Microsoft.EntityFrameworkCore.Design.dll.so => 116
	i64 u0xd2505d8abeed6983, ; 656: lib_Microsoft.AspNetCore.Components.Web.dll.so => 103
	i64 u0xd2dd98c9336159bc, ; 657: pl/Microsoft.CodeAnalysis.Workspaces.resources.dll => 46
	i64 u0xd2f81fbcb13ba53e, ; 658: pt-BR/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 34
	i64 u0xd333d0af9e423810, ; 659: System.Runtime.InteropServices => 233
	i64 u0xd3426d966bb704f5, ; 660: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 158
	i64 u0xd3651b6fc3125825, ; 661: System.Private.Uri.dll => 227
	i64 u0xd373685349b1fe8b, ; 662: Microsoft.Extensions.Logging.dll => 131
	i64 u0xd3e4c8d6a2d5d470, ; 663: it/Microsoft.Maui.Controls.resources => 79
	i64 u0xd42655883bb8c19f, ; 664: Microsoft.EntityFrameworkCore.Abstractions.dll => 115
	i64 u0xd4645626dffec99d, ; 665: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 124
	i64 u0xd46b4a8758d1f3ee, ; 666: Microsoft.Extensions.FileProviders.Composite.dll => 127
	i64 u0xd5507e11a2b2839f, ; 667: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 170
	i64 u0xd65b511d6c4c27c4, ; 668: ru/Microsoft.CodeAnalysis.Workspaces.resources.dll => 48
	i64 u0xd6694f8359737e4e, ; 669: Xamarin.AndroidX.SavedState => 177
	i64 u0xd6d21782156bc35b, ; 670: Xamarin.AndroidX.SwipeRefreshLayout.dll => 178
	i64 u0xd72329819cbbbc44, ; 671: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 122
	i64 u0xd7b3764ada9d341d, ; 672: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 132
	i64 u0xd7f0088bc5ad71f2, ; 673: Xamarin.AndroidX.VersionedParcelable => 179
	i64 u0xd8113d9a7e8ad136, ; 674: System.CodeDom => 150
	i64 u0xd8eb7c27f86b76ec, ; 675: System.Composition.AttributedModel => 151
	i64 u0xd9d55047b066d4af, ; 676: lib_System.Composition.TypedParts.dll.so => 155
	i64 u0xda1dfa4c534a9251, ; 677: Microsoft.Extensions.DependencyInjection => 123
	i64 u0xdad05a11827959a3, ; 678: System.Collections.NonGeneric.dll => 190
	i64 u0xdb5383ab5865c007, ; 679: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 95
	i64 u0xdb8f858873e2186b, ; 680: SkiaSharp.Views.Maui.Controls => 144
	i64 u0xdbeda89f832aa805, ; 681: vi/Microsoft.Maui.Controls.resources.dll => 95
	i64 u0xdbf2a779fbc3ac31, ; 682: System.Transactions.Local.dll => 250
	i64 u0xdbf9607a441b4505, ; 683: System.Linq => 218
	i64 u0xdc75032002d1a212, ; 684: lib_System.Transactions.Local.dll.so => 250
	i64 u0xdca8be7403f92d4f, ; 685: lib_System.Linq.Queryable.dll.so => 217
	i64 u0xdcbf1e32b739302e, ; 686: de/Microsoft.CodeAnalysis.resources => 1
	i64 u0xdce2c53525640bf3, ; 687: Microsoft.Extensions.Logging => 131
	i64 u0xdd14049e4243731e, ; 688: lib-it-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 17
	i64 u0xdd2b722d78ef5f43, ; 689: System.Runtime.dll => 238
	i64 u0xdd67031857c72f96, ; 690: lib_System.Text.Encodings.Web.dll.so => 242
	i64 u0xdde30e6b77aa6f6c, ; 691: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 97
	i64 u0xde110ae80fa7c2e2, ; 692: System.Xml.XDocument.dll => 254
	i64 u0xde8769ebda7d8647, ; 693: hr/Microsoft.Maui.Controls.resources.dll => 76
	i64 u0xdfe65f83043045ba, ; 694: es/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 28
	i64 u0xe0142572c095a480, ; 695: Xamarin.AndroidX.AppCompat.dll => 157
	i64 u0xe02f89350ec78051, ; 696: Xamarin.AndroidX.CoordinatorLayout.dll => 161
	i64 u0xe082cda43904f933, ; 697: lib-it-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 30
	i64 u0xe0c9c0e54d9b34ce, ; 698: it/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 30
	i64 u0xe192a588d4410686, ; 699: lib_System.IO.Pipelines.dll.so => 214
	i64 u0xe1a08bd3fa539e0d, ; 700: System.Runtime.Loader => 234
	i64 u0xe1b52f9f816c70ef, ; 701: System.Private.Xml.Linq.dll => 228
	i64 u0xe1e852de9692e4b8, ; 702: es/Microsoft.CodeAnalysis.CSharp.resources => 15
	i64 u0xe2420585aeceb728, ; 703: System.Net.Requests.dll => 223
	i64 u0xe29b73bc11392966, ; 704: lib-id-Microsoft.Maui.Controls.resources.dll.so => 78
	i64 u0xe31089e70e4e84ee, ; 705: Microsoft.AspNetCore.Components.WebView.Maui => 105
	i64 u0xe3811d68d4fe8463, ; 706: pt-BR/Microsoft.Maui.Controls.resources.dll => 86
	i64 u0xe444e79b0a785818, ; 707: fr/Microsoft.CodeAnalysis.Workspaces.resources => 42
	i64 u0xe494f7ced4ecd10a, ; 708: hu/Microsoft.Maui.Controls.resources.dll => 77
	i64 u0xe4a9b1e40d1e8917, ; 709: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 72
	i64 u0xe4ced86af5b5007d, ; 710: it/Microsoft.CodeAnalysis.Workspaces.resources.dll => 43
	i64 u0xe4f74a0b5bf9703f, ; 711: System.Runtime.Serialization.Primitives => 237
	i64 u0xe51aadb833ed7eb1, ; 712: lib_Microsoft.CodeAnalysis.CSharp.dll.so => 108
	i64 u0xe529964b351f8a52, ; 713: pt-BR/Microsoft.CodeAnalysis.CSharp.resources.dll => 21
	i64 u0xe5434e8a119ceb69, ; 714: lib_Mono.Android.dll.so => 262
	i64 u0xe7b916eaefda3b00, ; 715: fr/Microsoft.CodeAnalysis.resources.dll => 3
	i64 u0xe7dd1e7ea292e8bc, ; 716: ko/Microsoft.CodeAnalysis.resources => 6
	i64 u0xe7e03cc18dcdeb49, ; 717: lib_System.Diagnostics.StackTrace.dll.so => 203
	i64 u0xe89a2a9ef110899b, ; 718: System.Drawing.dll => 207
	i64 u0xe901486a5c561f62, ; 719: lib_System.Composition.Runtime.dll.so => 154
	i64 u0xe912b82a211c3a0c, ; 720: System.Composition.Convention => 152
	i64 u0xe954f97da1fa29b7, ; 721: lib-es-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 54
	i64 u0xe9772100456fb4b4, ; 722: Microsoft.AspNetCore.Components.dll => 101
	i64 u0xea154e342c6ac70f, ; 723: Microsoft.Extensions.FileProviders.Embedded.dll => 128
	i64 u0xeb2a85c519c97dc0, ; 724: lib-zh-Hans-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 63
	i64 u0xeb5295eb539fe516, ; 725: ko/Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources => 58
	i64 u0xeca8221ac42d17b7, ; 726: zh-Hant/Microsoft.CodeAnalysis.Workspaces.resources => 51
	i64 u0xed19c616b3fcb7eb, ; 727: Xamarin.AndroidX.VersionedParcelable.dll => 179
	i64 u0xedc4817167106c23, ; 728: System.Net.Sockets.dll => 224
	i64 u0xedc632067fb20ff3, ; 729: System.Memory.dll => 219
	i64 u0xedc8e4ca71a02a8b, ; 730: Xamarin.AndroidX.Navigation.Runtime.dll => 174
	i64 u0xededd1ea2a7b3104, ; 731: de/Microsoft.CodeAnalysis.Workspaces.resources => 40
	i64 u0xee81f5b3f1c4f83b, ; 732: System.Threading.ThreadPool => 248
	i64 u0xeeb7ebb80150501b, ; 733: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 160
	i64 u0xef03b1b5a04e9709, ; 734: System.Text.Encoding.CodePages.dll => 240
	i64 u0xef72742e1bcca27a, ; 735: Microsoft.Maui.Essentials.dll => 139
	i64 u0xefec0b7fdc57ec42, ; 736: Xamarin.AndroidX.Activity => 156
	i64 u0xf008bcd238ede2c8, ; 737: System.CodeDom.dll => 150
	i64 u0xf00c29406ea45e19, ; 738: es/Microsoft.Maui.Controls.resources.dll => 71
	i64 u0xf017a06a4015fe38, ; 739: System.Composition.Convention.dll => 152
	i64 u0xf08d1c3986e90962, ; 740: lib-ru-Microsoft.CodeAnalysis.Workspaces.MSBuild.BuildHost.resources.dll.so => 61
	i64 u0xf11b621fc87b983f, ; 741: Microsoft.Maui.Controls.Xaml.dll => 137
	i64 u0xf1c4b4005493d871, ; 742: System.Formats.Asn1.dll => 208
	i64 u0xf238bd79489d3a96, ; 743: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 84
	i64 u0xf27ac96c4a2c11ce, ; 744: lib-fr-Microsoft.CodeAnalysis.resources.dll.so => 3
	i64 u0xf2f5129629f67302, ; 745: pt-BR/Microsoft.CodeAnalysis.Workspaces.resources.dll => 47
	i64 u0xf37221fda4ef8830, ; 746: lib_Xamarin.Google.Android.Material.dll.so => 182
	i64 u0xf3a3da005d4159f2, ; 747: pl/Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll => 33
	i64 u0xf3ddfe05336abf29, ; 748: System => 257
	i64 u0xf4103170a1de5bd0, ; 749: System.Linq.Queryable.dll => 217
	i64 u0xf41b241c82f75cde, ; 750: ru/Microsoft.CodeAnalysis.CSharp.resources.dll => 22
	i64 u0xf41eebf9fb91e2a1, ; 751: it/Microsoft.CodeAnalysis.resources.dll => 4
	i64 u0xf45bb3f8ce038e01, ; 752: es/Microsoft.CodeAnalysis.Workspaces.resources.dll => 41
	i64 u0xf4727d423e5d26f3, ; 753: SkiaSharp => 142
	i64 u0xf4c1dd70a5496a17, ; 754: System.IO.Compression => 211
	i64 u0xf4d8549f44ddc6a4, ; 755: lib_System.Composition.Convention.dll.so => 152
	i64 u0xf588f7d9fcfd771e, ; 756: lib-fr-Microsoft.CodeAnalysis.CSharp.Workspaces.resources.dll.so => 29
	i64 u0xf5967aac376787d7, ; 757: Microsoft.CodeAnalysis.dll => 107
	i64 u0xf6077741019d7428, ; 758: Xamarin.AndroidX.CoordinatorLayout => 161
	i64 u0xf61dacd80708509f, ; 759: Microsoft.CodeAnalysis.CSharp.Workspaces => 109
	i64 u0xf77b20923f07c667, ; 760: de/Microsoft.Maui.Controls.resources.dll => 69
	i64 u0xf7e2cac4c45067b3, ; 761: lib_System.Numerics.Vectors.dll.so => 225
	i64 u0xf7e74930e0e3d214, ; 762: zh-HK/Microsoft.Maui.Controls.resources.dll => 96
	i64 u0xf84773b5c81e3cef, ; 763: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 94
	i64 u0xf8aac5ea82de1348, ; 764: System.Linq.Queryable => 217
	i64 u0xf8b77539b362d3ba, ; 765: lib_System.Reflection.Primitives.dll.so => 231
	i64 u0xf8e045dc345b2ea3, ; 766: lib_Xamarin.AndroidX.RecyclerView.dll.so => 176
	i64 u0xf915dc29808193a1, ; 767: System.Web.HttpUtility.dll => 251
	i64 u0xf96c777a2a0686f4, ; 768: hi/Microsoft.Maui.Controls.resources.dll => 75
	i64 u0xf9eec5bb3a6aedc6, ; 769: Microsoft.Extensions.Options => 133
	i64 u0xf9f832cfad9554ff, ; 770: ru/Microsoft.CodeAnalysis.Workspaces.resources => 48
	i64 u0xfa504dfa0f097d72, ; 771: Microsoft.Extensions.FileProviders.Abstractions.dll => 126
	i64 u0xfa5ed7226d978949, ; 772: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 65
	i64 u0xfa645d91e9fc4cba, ; 773: System.Threading.Thread => 247
	i64 u0xfa72c187a9b70a63, ; 774: lib_System.Composition.Hosting.dll.so => 153
	i64 u0xfa99d44ebf9bea5b, ; 775: SkiaSharp.Views.Maui.Core => 145
	i64 u0xfaee584671def13d, ; 776: Humanizer => 100
	i64 u0xfb022853d73b7fa5, ; 777: lib_SQLitePCLRaw.batteries_v2.dll.so => 146
	i64 u0xfbf0a31c9fc34bc4, ; 778: lib_System.Net.Http.dll.so => 220
	i64 u0xfc6b7527cc280b3f, ; 779: lib_System.Runtime.Serialization.Formatters.dll.so => 236
	i64 u0xfc719aec26adf9d9, ; 780: Xamarin.AndroidX.Navigation.Fragment.dll => 173
	i64 u0xfcd302092ada6328, ; 781: System.IO.MemoryMappedFiles.dll => 213
	i64 u0xfd22f00870e40ae0, ; 782: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 165
	i64 u0xfd2e866c678cac90, ; 783: lib_Microsoft.AspNetCore.Components.WebView.Maui.dll.so => 105
	i64 u0xfd49b3c1a76e2748, ; 784: System.Runtime.InteropServices.RuntimeInformation => 232
	i64 u0xfd536c702f64dc47, ; 785: System.Text.Encoding.Extensions => 241
	i64 u0xfd583f7657b6a1cb, ; 786: Xamarin.AndroidX.Fragment => 166
	i64 u0xfeae9952cf03b8cb, ; 787: tr/Microsoft.Maui.Controls.resources => 93
	i64 u0xfec8e01187d0178c ; 788: lib-ja-Microsoft.CodeAnalysis.CSharp.resources.dll.so => 18
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [789 x i32] [
	i32 209, i32 178, i32 193, i32 110, i32 111, i32 174, i32 120, i32 261,
	i32 157, i32 32, i32 59, i32 149, i32 58, i32 89, i32 67, i32 95,
	i32 222, i32 176, i32 113, i32 192, i32 138, i32 113, i32 96, i32 252,
	i32 57, i32 160, i32 101, i32 256, i32 111, i32 89, i32 190, i32 31,
	i32 231, i32 165, i32 193, i32 133, i32 190, i32 51, i32 239, i32 230,
	i32 119, i32 245, i32 90, i32 185, i32 106, i32 180, i32 150, i32 57,
	i32 86, i32 262, i32 139, i32 12, i32 4, i32 29, i32 143, i32 1,
	i32 164, i32 107, i32 107, i32 210, i32 22, i32 19, i32 176, i32 14,
	i32 186, i32 12, i32 73, i32 260, i32 74, i32 124, i32 19, i32 23,
	i32 64, i32 125, i32 215, i32 258, i32 26, i32 77, i32 242, i32 53,
	i32 185, i32 13, i32 83, i32 12, i32 27, i32 5, i32 188, i32 15,
	i32 257, i32 92, i32 60, i32 102, i32 7, i32 129, i32 261, i32 63,
	i32 50, i32 203, i32 175, i32 81, i32 246, i32 133, i32 61, i32 201,
	i32 36, i32 46, i32 210, i32 202, i32 209, i32 238, i32 92, i32 215,
	i32 247, i32 114, i32 197, i32 162, i32 9, i32 237, i32 61, i32 112,
	i32 73, i32 146, i32 52, i32 32, i32 183, i32 134, i32 10, i32 78,
	i32 76, i32 26, i32 260, i32 222, i32 142, i32 46, i32 94, i32 221,
	i32 204, i32 72, i32 244, i32 208, i32 98, i32 106, i32 130, i32 57,
	i32 85, i32 240, i32 228, i32 62, i32 249, i32 91, i32 31, i32 243,
	i32 7, i32 70, i32 135, i32 202, i32 253, i32 205, i32 119, i32 186,
	i32 166, i32 58, i32 128, i32 99, i32 159, i32 206, i32 0, i32 144,
	i32 73, i32 253, i32 55, i32 130, i32 189, i32 71, i32 50, i32 224,
	i32 127, i32 53, i32 138, i32 67, i32 20, i32 136, i32 193, i32 181,
	i32 121, i32 43, i32 16, i32 110, i32 213, i32 231, i32 189, i32 153,
	i32 43, i32 34, i32 164, i32 180, i32 66, i32 126, i32 29, i32 45,
	i32 241, i32 135, i32 183, i32 248, i32 252, i32 162, i32 146, i32 104,
	i32 34, i32 172, i32 145, i32 2, i32 158, i32 256, i32 199, i32 258,
	i32 262, i32 85, i32 187, i32 237, i32 183, i32 115, i32 204, i32 125,
	i32 52, i32 89, i32 111, i32 252, i32 25, i32 87, i32 213, i32 116,
	i32 41, i32 226, i32 179, i32 3, i32 151, i32 175, i32 50, i32 44,
	i32 24, i32 14, i32 243, i32 143, i32 117, i32 32, i32 171, i32 221,
	i32 216, i32 229, i32 234, i32 79, i32 63, i32 171, i32 135, i32 37,
	i32 261, i32 240, i32 13, i32 245, i32 66, i32 35, i32 39, i32 148,
	i32 136, i32 169, i32 199, i32 207, i32 222, i32 198, i32 162, i32 140,
	i32 19, i32 90, i32 221, i32 232, i32 96, i32 238, i32 16, i32 167,
	i32 191, i32 145, i32 227, i32 21, i32 55, i32 45, i32 147, i32 259,
	i32 200, i32 38, i32 80, i32 123, i32 16, i32 187, i32 154, i32 161,
	i32 249, i32 196, i32 144, i32 68, i32 45, i32 2, i32 23, i32 131,
	i32 201, i32 10, i32 37, i32 105, i32 54, i32 246, i32 233, i32 160,
	i32 191, i32 242, i32 194, i32 253, i32 198, i32 148, i32 70, i32 44,
	i32 123, i32 184, i32 62, i32 219, i32 137, i32 69, i32 234, i32 27,
	i32 259, i32 38, i32 36, i32 189, i32 182, i32 54, i32 47, i32 9,
	i32 136, i32 235, i32 197, i32 169, i32 163, i32 41, i32 56, i32 68,
	i32 206, i32 116, i32 208, i32 74, i32 154, i32 148, i32 20, i32 56,
	i32 60, i32 233, i32 108, i32 83, i32 48, i32 47, i32 140, i32 134,
	i32 163, i32 134, i32 109, i32 173, i32 25, i32 138, i32 67, i32 212,
	i32 18, i32 93, i32 83, i32 42, i32 79, i32 194, i32 76, i32 255,
	i32 219, i32 118, i32 121, i32 177, i32 49, i32 235, i32 82, i32 92,
	i32 10, i32 166, i32 59, i32 108, i32 56, i32 104, i32 72, i32 113,
	i32 195, i32 90, i32 69, i32 44, i32 82, i32 102, i32 225, i32 49,
	i32 192, i32 205, i32 37, i32 226, i32 100, i32 196, i32 180, i32 122,
	i32 168, i32 40, i32 230, i32 24, i32 149, i32 103, i32 257, i32 98,
	i32 30, i32 157, i32 159, i32 207, i32 94, i32 59, i32 97, i32 127,
	i32 246, i32 215, i32 117, i32 142, i32 155, i32 98, i32 121, i32 130,
	i32 115, i32 247, i32 210, i32 139, i32 1, i32 184, i32 258, i32 194,
	i32 232, i32 119, i32 28, i32 171, i32 200, i32 35, i32 202, i32 74,
	i32 21, i32 126, i32 163, i32 118, i32 249, i32 188, i32 26, i32 172,
	i32 75, i32 88, i32 147, i32 87, i32 86, i32 0, i32 24, i32 209,
	i32 147, i32 204, i32 99, i32 211, i32 169, i32 137, i32 20, i32 164,
	i32 243, i32 39, i32 218, i32 66, i32 39, i32 11, i32 255, i32 40,
	i32 22, i32 82, i32 211, i32 71, i32 51, i32 153, i32 78, i32 140,
	i32 196, i32 188, i32 25, i32 216, i32 174, i32 6, i32 81, i32 8,
	i32 33, i32 250, i32 62, i32 17, i32 7, i32 35, i32 23, i32 255,
	i32 156, i32 122, i32 9, i32 84, i32 17, i32 172, i32 168, i32 36,
	i32 129, i32 31, i32 239, i32 182, i32 175, i32 214, i32 143, i32 128,
	i32 8, i32 81, i32 102, i32 198, i32 236, i32 212, i32 225, i32 239,
	i32 177, i32 165, i32 167, i32 77, i32 129, i32 4, i32 53, i32 132,
	i32 229, i32 220, i32 38, i32 203, i32 124, i32 15, i32 70, i32 110,
	i32 216, i32 235, i32 168, i32 254, i32 88, i32 245, i32 60, i32 84,
	i32 251, i32 195, i32 260, i32 226, i32 13, i32 118, i32 170, i32 91,
	i32 186, i32 205, i32 2, i32 101, i32 244, i32 68, i32 28, i32 64,
	i32 8, i32 159, i32 109, i32 75, i32 65, i32 18, i32 214, i32 201,
	i32 132, i32 248, i32 52, i32 5, i32 206, i32 91, i32 141, i32 55,
	i32 259, i32 256, i32 187, i32 87, i32 80, i32 254, i32 192, i32 104,
	i32 224, i32 11, i32 236, i32 5, i32 149, i32 220, i32 181, i32 158,
	i32 100, i32 14, i32 65, i32 151, i32 141, i32 197, i32 218, i32 6,
	i32 114, i32 156, i32 80, i32 212, i32 181, i32 112, i32 125, i32 106,
	i32 11, i32 155, i32 114, i32 170, i32 120, i32 195, i32 223, i32 173,
	i32 229, i32 33, i32 227, i32 49, i32 141, i32 27, i32 241, i32 251,
	i32 191, i32 103, i32 120, i32 93, i32 85, i32 88, i32 117, i32 99,
	i32 244, i32 184, i32 185, i32 199, i32 42, i32 97, i32 223, i32 178,
	i32 64, i32 200, i32 228, i32 112, i32 230, i32 0, i32 167, i32 116,
	i32 103, i32 46, i32 34, i32 233, i32 158, i32 227, i32 131, i32 79,
	i32 115, i32 124, i32 127, i32 170, i32 48, i32 177, i32 178, i32 122,
	i32 132, i32 179, i32 150, i32 151, i32 155, i32 123, i32 190, i32 95,
	i32 144, i32 95, i32 250, i32 218, i32 250, i32 217, i32 1, i32 131,
	i32 17, i32 238, i32 242, i32 97, i32 254, i32 76, i32 28, i32 157,
	i32 161, i32 30, i32 30, i32 214, i32 234, i32 228, i32 15, i32 223,
	i32 78, i32 105, i32 86, i32 42, i32 77, i32 72, i32 43, i32 237,
	i32 108, i32 21, i32 262, i32 3, i32 6, i32 203, i32 207, i32 154,
	i32 152, i32 54, i32 101, i32 128, i32 63, i32 58, i32 51, i32 179,
	i32 224, i32 219, i32 174, i32 40, i32 248, i32 160, i32 240, i32 139,
	i32 156, i32 150, i32 71, i32 152, i32 61, i32 137, i32 208, i32 84,
	i32 3, i32 47, i32 182, i32 33, i32 257, i32 217, i32 22, i32 4,
	i32 41, i32 142, i32 211, i32 152, i32 29, i32 107, i32 161, i32 109,
	i32 69, i32 225, i32 96, i32 94, i32 217, i32 231, i32 176, i32 251,
	i32 75, i32 133, i32 48, i32 126, i32 65, i32 247, i32 153, i32 145,
	i32 100, i32 146, i32 220, i32 236, i32 173, i32 213, i32 165, i32 105,
	i32 232, i32 241, i32 166, i32 93, i32 18
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ be1cab92326783479054e72990da08008e5be819"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
