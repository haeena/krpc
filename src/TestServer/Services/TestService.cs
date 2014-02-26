using System;
using KRPC.Service.Attributes;

namespace TestServer.Services
{
    [KRPCService]
    public static class TestService
    {
        [KRPCProcedure]
        public static string FloatToString (float value)
        {
            return value.ToString ();
        }

        [KRPCProcedure]
        public static string Int32ToString (int value)
        {
            return value.ToString ();
        }

        [KRPCProcedure]
        public static string Int64ToString (long value)
        {
            return value.ToString ();
        }

        [KRPCProcedure]
        public static string BoolToString (bool value)
        {
            return value.ToString ();
        }

        [KRPCProcedure]
        public static int StringToInt32 (string value)
        {
            return Convert.ToInt32 (value);
        }

        [KRPCProcedure]
        public static string AddMultipleValues (float x, int y, long z)
        {
            return (x + y + z).ToString ();
        }

        [KRPCProperty]
        public static string StringProperty { get; set; }

        [KRPCProperty]
        public static string StringPropertyPrivateGet { private get; set; }

        static string stringPropertyPrivateSet = "foo";

        [KRPCProperty]
        public static string StringPropertyPrivateSet {
            get { return stringPropertyPrivateSet; }
            private set { stringPropertyPrivateSet = value; }
        }

        [KRPCProcedure]
        public static TestClass CreateTestObject (string value)
        {
            return new TestClass (value);
        }

        [KRPCClass]
        public class TestClass
        {
            string value;

            public TestClass (string value)
            {
                this.value = value;
            }

            [KRPCMethod]
            public string GetValue ()
            {
                return "value=" + value;
            }

            [KRPCMethod]
            public string FloatToString (float x)
            {
                return value + x.ToString ();
            }

            [KRPCMethod]
            public string ObjectToString (TestClass other)
            {
                return value + other.value;
            }

            [KRPCProperty]
            public int IntProperty { get; set; }

            [KRPCProperty]
            public TestClass ObjectProperty { get; set; }
        }
    }
}

