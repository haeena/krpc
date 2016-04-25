using KRPC.Service.Attributes;

namespace KRPC.SpaceCenter.Services.Parts
{
    /// <summary>
    /// <see cref="RadiatorState"/>
    /// </summary>
    [KRPCEnum (Service = "SpaceCenter")]
    public enum RadiatorState
    {
        /// <summary>
        /// Radiator is fully extended.
        /// </summary>
        Extended,
        /// <summary>
        /// Radiator is fully retracted.
        /// </summary>
        Retracted,
        /// <summary>
        /// Radiator is being extended.
        /// </summary>
        Extending,
        /// <summary>
        /// Radiator is being retracted.
        /// </summary>
        Retracting,
        /// <summary>
        /// Radiator is being broken.
        /// </summary>
        Broken
    }
}