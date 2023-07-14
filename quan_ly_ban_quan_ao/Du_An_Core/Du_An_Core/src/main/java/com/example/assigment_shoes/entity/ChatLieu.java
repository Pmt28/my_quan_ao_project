package com.example.assigment_shoes.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "ChatLieu")
@Setter
@Getter
public class ChatLieu implements Serializable {

      @Id
      @GeneratedValue(strategy = GenerationType.IDENTITY)
      @Column(name = "maCL")
      private String maCL;

      @Column(name = "ten")
      private String ten;

      @Column(name = "ngayTao")
      private Date ngayTao;

      @Column(name = "ngaySua")
      private Date ngaySua;

      @Column(name = "trangThai")
      private Boolean trangThai;


}
