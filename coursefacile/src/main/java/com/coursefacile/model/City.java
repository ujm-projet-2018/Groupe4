package com.coursefacile.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "city")
public class City {
    @Id
    @GeneratedValue
    private int id;
    private String name;
    private String postalCode;
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "city")
    private Set<Mission> missions;

    public City() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }
}
