namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class SystemStatu
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ID { get; set; }

        public int? StatusId { get; set; }

        [StringLength(50)]
        public string StatusName { get; set; }

        [StringLength(10)]
        public string GroupName { get; set; }
    }
}
